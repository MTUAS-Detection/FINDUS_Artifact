#include "Section_UAS_logic.h"
#include<pthread.h>

// special section ids
const int FIELD_ID_INCIDENT_METADATA = 2;

// incident section parameters
const char INCIDENT_HELPER[] = "/system/bin/incident_helper";
const char* GZIP[] = {"/system/bin/gzip", NULL};

static pid_t fork_execute_incident_helper(const int id, Fpipe* p2cPipe, Fpipe* c2pPipe) {
    const char* ihArgs[]{INCIDENT_HELPER, "-s", String8::format("%d", id).string(), NULL};
    return fork_execute_cmd(const_cast<char**>(ihArgs), p2cPipe, c2pPipe);
}

// bool section_requires_specific_mention(int sectionId) {
//     switch (sectionId) {
//         case 3025: // restricted_images
//             return true;
//         case 3026: // system_trace
//             return true;
//         default:
//             return false;
//     }
// }

// ================================================================================
// Section::Section(int i, int64_t timeoutMs)
//     : id(i),
//       timeoutMs(timeoutMs) {
// }

// Section::~Section() {}

// ================================================================================
static inline bool isSysfs(const char* filename) { return strncmp(filename, "/sys/", 5) == 0; }

FileSection::FileSection(int id, const char* filename, const int64_t timeoutMs)
    : Section(id, timeoutMs), mFilename(filename) {
    name = "file ";
    name += filename;
    mIsSysfs = isSysfs(filename);
}

FileSection::~FileSection() {}


status_t FileSection::Execute(ReportWriter* writer) const {
    // read from mFilename first, make sure the file is available
    // add O_CLOEXEC to make sure it is closed when exec incident helper
    unique_fd fd(open(mFilename, O_RDONLY | O_CLOEXEC));
    if (fd.get() == -1) {
        ALOGW("[%s] failed to open file", this->name.string());
        // There may be some devices/architectures that won't have the file.
        // Just return here without an error.
        return NO_ERROR;
    }

    FdBuffer buffer;
    Fpipe p2cPipe;
    Fpipe c2pPipe;
    // initiate pipes to pass data to/from incident_helper
    if (!p2cPipe.init() || !c2pPipe.init()) {
        ALOGW("[%s] failed to setup pipes", this->name.string());
        return -errno;
    }

    pid_t pid = fork_execute_incident_helper(this->id, &p2cPipe, &c2pPipe);
    if (pid == -1) {
        ALOGW("[%s] failed to fork", this->name.string());
        return -errno;
    }

    // parent process
    status_t readStatus = buffer.readProcessedDataInStream(fd.get(), std::move(p2cPipe.writeFd()),
                                                           std::move(c2pPipe.readFd()),
                                                           this->timeoutMs, mIsSysfs);
    writer->setSectionStats(buffer);
    if (readStatus != NO_ERROR || buffer.timedOut()) {
        ALOGW("[%s] failed to read data from incident helper: %s, timedout: %s",
              this->name.string(), strerror(-readStatus), buffer.timedOut() ? "true" : "false");
        kill_child(pid);
        return readStatus;
    }

    status_t ihStatus = wait_child(pid);
    if (ihStatus != NO_ERROR) {
        ALOGW("[%s] abnormal child process: %s", this->name.string(), strerror(-ihStatus));
        return OK; // Not a fatal error.
    }

    return writer->writeSection(buffer);
}

GZipSection::GZipSection(int id, const char* filename, ...) : Section(id) {
    va_list args;
    va_start(args, filename);
    mFilenames = varargs(filename, args);
    va_end(args);
    name = "gzip";
    for (int i = 0; mFilenames[i] != NULL; i++) {
        name += " ";
        name += mFilenames[i];
    }
}

GZipSection::~GZipSection() { free(mFilenames); }

status_t GZipSection::Execute(ReportWriter* writer) const {
    // Reads the files in order, use the first available one.
    int index = 0;
    unique_fd fd;
    while (mFilenames[index] != NULL) {
        fd.reset(open(mFilenames[index], O_RDONLY | O_CLOEXEC));
        if (fd.get() != -1) {
            break;
        }
        ALOGW("GZipSection failed to open file %s", mFilenames[index]);
        index++;  // look at the next file.
    }
    if (fd.get() == -1) {
        ALOGW("[%s] can't open all the files", this->name.string());
        return NO_ERROR;  // e.g. LAST_KMSG will reach here in user build.
    }
    FdBuffer buffer;
    Fpipe p2cPipe;
    Fpipe c2pPipe;
    // initiate pipes to pass data to/from gzip
    if (!p2cPipe.init() || !c2pPipe.init()) {
        ALOGW("[%s] failed to setup pipes", this->name.string());
        return -errno;
    }

    pid_t pid = fork_execute_cmd((char* const*)GZIP, &p2cPipe, &c2pPipe);
    if (pid == -1) {
        ALOGW("[%s] failed to fork", this->name.string());
        return -errno;
    }
    // parent process

    // construct Fdbuffer to output GZippedfileProto, the reason to do this instead of using
    // ProtoOutputStream is to avoid allocation of another buffer inside ProtoOutputStream.
    sp<EncodedBuffer> internalBuffer = buffer.data();
    internalBuffer->writeHeader((uint32_t)GZippedFileProto::FILENAME, WIRE_TYPE_LENGTH_DELIMITED);
    size_t fileLen = strlen(mFilenames[index]);
    internalBuffer->writeRawVarint32(fileLen);
    for (size_t i = 0; i < fileLen; i++) {
        internalBuffer->writeRawByte(mFilenames[index][i]);
    }
    internalBuffer->writeHeader((uint32_t)GZippedFileProto::GZIPPED_DATA,
                                WIRE_TYPE_LENGTH_DELIMITED);
    size_t editPos = internalBuffer->wp()->pos();
    internalBuffer->wp()->move(8);  // reserve 8 bytes for the varint of the data size.
    size_t dataBeginAt = internalBuffer->wp()->pos();
    VLOG("[%s] editPos=%zu, dataBeginAt=%zu", this->name.string(), editPos, dataBeginAt);

    status_t readStatus = buffer.readProcessedDataInStream(
            fd.get(), std::move(p2cPipe.writeFd()), std::move(c2pPipe.readFd()), this->timeoutMs,
            isSysfs(mFilenames[index]));
    writer->setSectionStats(buffer);
    if (readStatus != NO_ERROR || buffer.timedOut()) {
        ALOGW("[%s] failed to read data from gzip: %s, timedout: %s", this->name.string(),
              strerror(-readStatus), buffer.timedOut() ? "true" : "false");
        kill_child(pid);
        return readStatus;
    }

    status_t gzipStatus = wait_child(pid);
    if (gzipStatus != NO_ERROR) {
        ALOGW("[%s] abnormal child process: %s", this->name.string(), strerror(-gzipStatus));
        return gzipStatus;
    }
    // Revisit the actual size from gzip result and edit the internal buffer accordingly.
    size_t dataSize = buffer.size() - dataBeginAt;
    internalBuffer->wp()->rewind()->move(editPos);
    internalBuffer->writeRawVarint32(dataSize);
    internalBuffer->copy(dataBeginAt, dataSize);

    return writer->writeSection(buffer);
}

// struct WorkerThreadData : public virtual RefBase {
//     const WorkerThreadSection* section;
//     Fpipe pipe;

//     // Lock protects these fields
//     std::mutex lock;
//     bool workerDone;
//     status_t workerError;

//     explicit WorkerThreadData(const WorkerThreadSection* section);
//     virtual ~WorkerThreadData();
// };

WorkerThreadData::WorkerThreadData(const WorkerThreadSection* sec)
    : section(sec), workerDone(false), workerError(NO_ERROR) {}

WorkerThreadData::~WorkerThreadData() {}

// ================================================================================
WorkerThreadSection::WorkerThreadSection(int id, const int64_t timeoutMs)
    : Section(id, timeoutMs) {}

WorkerThreadSection::~WorkerThreadSection() {}

void sigpipe_handler(int signum) {
    if (signum == SIGPIPE) {
        ALOGE("Wrote to a broken pipe\n");
    } else {
        ALOGE("Received unexpected signal: %d\n", signum);
    }
}
void* worker_thread_function(void* arg) {
    WorkerThreadData* data = static_cast<WorkerThreadData*>(arg);
    signal(SIGPIPE, sigpipe_handler);

    status_t err = data->section->BlockingCall(data->pipe.writeFd());
    {
        std::unique_lock<std::mutex> lock(data->lock);
        data->workerDone = true;
        data->workerError = err;
        data->pipe.writeFd().reset();
    }
    return nullptr;
}

status_t WorkerThreadSection::Execute(ReportWriter* writer) const {
    status_t err = NO_ERROR;
    bool workerDone = false;
    FdBuffer buffer;

    // Create shared data and pipe
    WorkerThreadData data(this);
    // if (!data.pipe.init()) {
    //     return -errno;
    // }

    // std::thread([&]() {
    //     // Don't crash the service if writing to a closed pipe (may happen if dumping times out)
    //     signal(SIGPIPE, sigpipe_handler);
    //     status_t err = data.section->BlockingCall(data.pipe.writeFd());
    //     {
    //         std::unique_lock<std::mutex> lock(data.lock);
    //         data.workerDone = true;
    //         data.workerError = err;
    //         // unique_fd is not thread safe. If we don't lock it, reset() may pause half way while
    //         // the other thread executes to the end, calling ~Fpipe, which is a race condition.
    //         data.pipe.writeFd().reset();
    //     }
    // }).detach();
    pthread_t thread;
    int rc = pthread_create(&thread, nullptr, worker_thread_function, &data);
    if (rc != 0) {
        ALOGE("[%s] Failed to create pthread: %s", this->name.string(), strerror(rc));
        return -rc;
    }
    pthread_detach(thread);


    // // Loop reading until either the timeout or the worker side is done (i.e. eof).
    // err = buffer.read(data.pipe.readFd().get(), this->timeoutMs);
    // if (err != NO_ERROR) {
    //     ALOGE("[%s] reader failed with error '%s'", this->name.string(), strerror(-err));
    // }

    // // If the worker side is finished, then return its error (which may overwrite
    // // our possible error -- but it's more interesting anyway). If not, then we timed out.
    // {
    //     std::unique_lock<std::mutex> lock(data.lock);
    //     data.pipe.close();
    //     if (data.workerError != NO_ERROR) {
    //         err = data.workerError;
    //         ALOGE("[%s] worker failed with error '%s'", this->name.string(), strerror(-err));
    //     }
    //     workerDone = data.workerDone;
    // }

    // writer->setSectionStats(buffer);
    // if (err != NO_ERROR) {
    //     char errMsg[128];
    //     snprintf(errMsg, 128, "[%s] failed with error '%s'",
    //         this->name.string(), strerror(-err));
    //     writer->error(this, err, "WorkerThreadSection failed.");
    //     return NO_ERROR;
    // }
    // if (buffer.truncated()) {
    //     ALOGW("[%s] too large, truncating", this->name.string());
    //     // Do not write a truncated section. It won't pass through the PrivacyFilter.
    //     return NO_ERROR;
    // }
    // if (!workerDone || buffer.timedOut()) {
    //     ALOGW("[%s] timed out", this->name.string());
    //     return NO_ERROR;
    // }

    // // Write the data that was collected
    // return writer->writeSection(buffer);
}

// // ================================================================================
// CommandSection::CommandSection(int id, const int64_t timeoutMs, const char* command, ...)
//     : Section(id, timeoutMs) {
//     va_list args;
//     va_start(args, command);
//     mCommand = varargs(command, args);
//     va_end(args);
//     name = "cmd";
//     for (int i = 0; mCommand[i] != NULL; i++) {
//         name += " ";
//         name += mCommand[i];
//     }
// }

// CommandSection::CommandSection(int id, const char* command, ...) : Section(id) {
//     va_list args;
//     va_start(args, command);
//     mCommand = varargs(command, args);
//     va_end(args);
//     name = "cmd";
//     for (int i = 0; mCommand[i] != NULL; i++) {
//         name += " ";
//         name += mCommand[i];
//     }
// }

// CommandSection::~CommandSection() { free(mCommand); }

// status_t CommandSection::Execute(ReportWriter* writer) const {
//     FdBuffer buffer;
//     Fpipe cmdPipe;
//     Fpipe ihPipe;

//     if (!cmdPipe.init() || !ihPipe.init()) {
//         ALOGW("[%s] failed to setup pipes", this->name.string());
//         return -errno;
//     }

//     pid_t cmdPid = fork_execute_cmd((char* const*)mCommand, NULL, &cmdPipe);
//     if (cmdPid == -1) {
//         ALOGW("[%s] failed to fork", this->name.string());
//         return -errno;
//     }
//     pid_t ihPid = fork_execute_incident_helper(this->id, &cmdPipe, &ihPipe);
//     if (ihPid == -1) {
//         ALOGW("[%s] failed to fork", this->name.string());
//         return -errno;
//     }

//     cmdPipe.writeFd().reset();
//     status_t readStatus = buffer.read(ihPipe.readFd().get(), this->timeoutMs);
//     writer->setSectionStats(buffer);
//     if (readStatus != NO_ERROR || buffer.timedOut()) {
//         ALOGW("[%s] failed to read data from incident helper: %s, timedout: %s",
//               this->name.string(), strerror(-readStatus), buffer.timedOut() ? "true" : "false");
//         kill_child(cmdPid);
//         kill_child(ihPid);
//         return readStatus;
//     }

//     // Waiting for command here has one trade-off: the failed status of command won't be detected
//     // until buffer timeout, but it has advatage on starting the data stream earlier.
//     status_t cmdStatus = wait_child(cmdPid);
//     status_t ihStatus = wait_child(ihPid);
//     if (cmdStatus != NO_ERROR || ihStatus != NO_ERROR) {
//         ALOGW("[%s] abnormal child processes, return status: command: %s, incident helper: %s",
//               this->name.string(), strerror(-cmdStatus), strerror(-ihStatus));
//         // Not a fatal error.
//         return NO_ERROR;
//     }

//     return writer->writeSection(buffer);
// }

// DumpsysSection::DumpsysSection(int id, const char* service, ...)
//     : WorkerThreadSection(id, REMOTE_CALL_TIMEOUT_MS), mService(service) {
//     name = "dumpsys ";
//     name += service;

//     va_list args;
//     va_start(args, service);
//     while (true) {
//         const char* arg = va_arg(args, const char*);
//         if (arg == NULL) {
//             break;
//         }
//         mArgs.add(String16(arg));
//         name += " ";
//         name += arg;
//     }
//     va_end(args);
// }

// DumpsysSection::~DumpsysSection() {}

// status_t DumpsysSection::BlockingCall(unique_fd& pipeWriteFd) const {
//     // checkService won't wait for the service to show up like getService will.
//     sp<IBinder> service = defaultServiceManager()->checkService(mService);

//     if (service == NULL) {
//         ALOGW("DumpsysSection: Can't lookup service: %s", String8(mService).string());
//         return NAME_NOT_FOUND;
//     }

//     service->dump(pipeWriteFd.get(), mArgs);

//     return NO_ERROR;
// }

// // ================================================================================
TextDumpsysSection::TextDumpsysSection(int id, const char* service, ...)
    : WorkerThreadSection(id, REMOTE_CALL_TIMEOUT_MS), mService(service) {
    name = "dumpsys ";
    name += service;

    va_list args;
    va_start(args, service);
    while (true) {
        const char* arg;
        // const char* arg = va_arg(args, const char*);
        if (arg == NULL) {
            break;
        }
        mArgs.add(String16(arg));
        name += " ";
        name += arg;
    }
//     va_end(args);
}

// TextDumpsysSection::~TextDumpsysSection() {}

status_t TextDumpsysSection::BlockingCall(unique_fd& pipeWriteFd) const {
    // checkService won't wait for the service to show up like getService will.
    sp<IBinder> service = defaultServiceManager()->checkService(mService);
    if (service == NULL) {
        ALOGW("TextDumpsysSection: Can't lookup service: %s", String8(mService).string());
        return NAME_NOT_FOUND;
    }

    // Create pipe
    Fpipe dumpPipe;
    if (!dumpPipe.init()) {
        ALOGW("[%s] failed to setup pipe", this->name.string());
        return -errno;
    }

    // Run dumping thread
    const uint64_t start = Nanotime();
    std::thread worker([&]() {
        // Don't crash the service if writing to a closed pipe (may happen if dumping times out)
        signal(SIGPIPE, sigpipe_handler);
        status_t err = service->dump(dumpPipe.writeFd().get(), mArgs);
        if (err != OK) {
            ALOGW("[%s] dump thread failed. Error: %s", this->name.string(), strerror(-err));
        }
        dumpPipe.writeFd().reset();
    });

    // Collect dump content
    std::string content;
    bool success = ReadFdToString(dumpPipe.readFd(), &content);
    worker.join(); // Wait for worker to finish
    dumpPipe.readFd().reset();
    if (!success) {
        ALOGW("[%s] failed to read data from pipe", this->name.string());
        return -1;
    }

    ProtoOutputStream proto;
    proto.write(util::TextDumpProto::COMMAND, std::string(name.string()));
    proto.write(util::TextDumpProto::CONTENT, content);
    proto.write(util::TextDumpProto::DUMP_DURATION_NS, int64_t(Nanotime() - start));

    if (!proto.flush(pipeWriteFd.get()) && errno == EPIPE) {
        ALOGE("[%s] wrote to a broken pipe\n", this->name.string());
        return EPIPE;
    }
    return OK;
}
// ================================================================================
// initialization only once in Section.cpp.
map<log_id_t, log_time> LogSection::gLastLogsRetrieved;

LogSection::LogSection(int id, const char* logID, ...) : WorkerThreadSection(id), mLogMode(logModeBase) {
    name = "logcat -b ";
    name += logID;

    va_list args;
    va_start(args, logID);
    mLogID = android_name_to_log_id(logID);
    while(true) {
        const char* arg = va_arg(args, const char*);
        if (arg == NULL) {
            break;
        }
        if (!strcmp(arg, "-L")) {
          // Read from last logcat buffer
          mLogMode = mLogMode | ANDROID_LOG_PSTORE;
        }
        name += " ";
        name += arg;
    }
    va_end(args);

    switch (mLogID) {
        case LOG_ID_EVENTS:
        case LOG_ID_STATS:
        case LOG_ID_SECURITY:
            mBinary = true;
            break;
        default:
            mBinary = false;
    }
}

// LogSection::~LogSection() {}

static size_t trimTail(char const* buf, size_t len) {
    while (len > 0) {
        char c = buf[len - 1];
        if (c == '\0' || c == ' ' || c == '\n' || c == '\r' || c == ':') {
            len--;
        } else {
            break;
        }
    }
    return len;
}

static inline int32_t get4LE(uint8_t const* src) {
    return src[0] | (src[1] << 8) | (src[2] << 16) | (src[3] << 24);
}



TombstoneSection::TombstoneSection(int id, const char* type, const int64_t timeoutMs)
    : WorkerThreadSection(id, timeoutMs), mType(type) {
    name = "tombstone ";
    name += type;
}

// TombstoneSection::~TombstoneSection() {}



status_t TombstoneSection::BlockingCall(unique_fd& pipeWriteFd) const {
    std::unique_ptr<DIR, decltype(&closedir)> proc(opendir("/proc"), closedir);
    if (proc.get() == nullptr) {
        ALOGE("opendir /proc failed: %s\n", strerror(errno));
        return -errno;
    }

    const std::set<int> hal_pids = get_interesting_hal_pids();

    ProtoOutputStream proto;
    struct dirent* d;
    status_t err = NO_ERROR;
    while ((d = readdir(proc.get()))) {
        int pid = atoi(d->d_name);
        if (pid <= 0) {
            continue;
        }

        const std::string link_name = android::base::StringPrintf("/proc/%d/exe", pid);
        std::string exe;
        if (!android::base::Readlink(link_name, &exe)) {
            ALOGE("Section %s: Can't read '%s': %s\n", name.string(),
                    link_name.c_str(), strerror(errno));
            continue;
        }

        bool is_java_process;
        if (exe == "/system/bin/app_process32" || exe == "/system/bin/app_process64") {
            if (mType != "java") continue;
            // Don't bother dumping backtraces for the zygote.
            if (IsZygote(pid)) {
                VLOG("Skipping Zygote");
                continue;
            }

            is_java_process = true;
        } else if (should_dump_native_traces(exe.c_str())) {
            if (mType != "native") continue;
            is_java_process = false;
        } else if (hal_pids.find(pid) != hal_pids.end()) {
            if (mType != "hal") continue;
            is_java_process = false;
        } else {
            // Probably a native process we don't care about, continue.
            VLOG("Skipping %d", pid);
            continue;
        }

        Fpipe dumpPipe;
        if (!dumpPipe.init()) {
            ALOGW("[%s] failed to setup dump pipe", this->name.string());
            err = -errno;
            break;
        }

        const uint64_t start = Nanotime();
        pid_t child = fork();
        if (child < 0) {
            ALOGE("Failed to fork child process");
            break;
        } else if (child == 0) {
            // This is the child process.
            dumpPipe.readFd().reset();
            const int ret = dump_backtrace_to_file_timeout(
                    pid, is_java_process ? kDebuggerdJavaBacktrace : kDebuggerdNativeBacktrace,
                    is_java_process ? 5 : 20, dumpPipe.writeFd().get());
            if (ret == -1) {
                if (errno == 0) {
                    ALOGW("Dumping failed for pid '%d', likely due to a timeout\n", pid);
                } else {
                    ALOGE("Dumping failed for pid '%d': %s\n", pid, strerror(errno));
                }
            }
            dumpPipe.writeFd().reset();
            _exit(EXIT_SUCCESS);
        }
        dumpPipe.writeFd().reset();
        // Parent process.
        // Read from the pipe concurrently to avoid blocking the child.
        FdBuffer buffer;
        err = buffer.readFully(dumpPipe.readFd().get());
        // Wait on the child to avoid it becoming a zombie process.
        status_t cStatus = wait_child(child);
        if (err != NO_ERROR) {
            ALOGW("[%s] failed to read stack dump: %d", this->name.string(), err);
            dumpPipe.readFd().reset();
            break;
        }
        if (cStatus != NO_ERROR) {
            ALOGE("[%s] child had an issue: %s\n", this->name.string(), strerror(-cStatus));
        }

        auto dump = std::make_unique<char[]>(buffer.size());
        sp<ProtoReader> reader = buffer.data()->read();
        int i = 0;
        while (reader->hasNext()) {
            dump[i] = reader->next();
            i++;
        }
        uint64_t token = proto.start(android::os::BackTraceProto::TRACES);
        proto.write(android::os::BackTraceProto::Stack::PID, pid);
        proto.write(android::os::BackTraceProto::Stack::DUMP, dump.get(), i);
        proto.write(android::os::BackTraceProto::Stack::DUMP_DURATION_NS,
                    static_cast<long long>(Nanotime() - start));
        proto.end(token);
        dumpPipe.readFd().reset();
    }

    if (!proto.flush(pipeWriteFd.get()) && errno == EPIPE) {
        ALOGE("[%s] wrote to a broken pipe\n", this->name.string());
        if (err != NO_ERROR) {
            return EPIPE;
        }
    }

    return err;
}
// ================================================================================
BringYourOwnSection::BringYourOwnSection(int id, const char* customName, const uid_t callingUid,
        const sp<IIncidentDumpCallback>& callback)
    : WorkerThreadSection(id, REMOTE_CALL_TIMEOUT_MS), uid(callingUid), mCallback(callback) {
    name = "registered ";
    name += customName;
}

// BringYourOwnSection::~BringYourOwnSection() {}

status_t BringYourOwnSection::BlockingCall(unique_fd& pipeWriteFd) const {
    android::os::ParcelFileDescriptor pfd(std::move(pipeWriteFd));
    mCallback->onDumpSection(pfd);
    return NO_ERROR;
}






