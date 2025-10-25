
#ifndef SECTION_UAS_LOGIC_H
#define SECTION_UAS_LOGIC_H

#include <stdint.h>
#include <stddef.h>
#include <string>
#include <vector>
#include <mutex>
#include <memory>
#include <unistd.h>
#include <signal.h>
#include <fcntl.h>
#include <cstring>
#include <cstdlib>
#include <stdarg.h>
#include <thread>
#include <errno.h>
#include <map>
#include <set>
#include <dirent.h>
#include <stdio.h>
#include <utility>  // for std::move
#include <cstdio>
#include <cstring>


using namespace std;

#define ALOGE(...) ((void)0)
#define ALOGW(...) ((void)0)
#define VLOG(...) ((void)0)

typedef int32_t status_t;
// typedef int uid_t;

#define NO_ERROR 0
#define OK 0
#define NAME_NOT_FOUND (-1)
#define REMOTE_CALL_TIMEOUT_MS 3000
#define EPIPE 32



class ReportWriter;
class EncodedBuffer;
class Section;
class WorkerThreadSection;
class FileSection;
class GZipSection;
class IIncidentDumpCallback;


template <typename T>
class sp {
public:
    sp() : ptr(nullptr) {}
    sp(T* p) : ptr(p) {}
    T* operator->() const { return ptr; }
    T& operator*() const { return *ptr; }
    operator bool() const { return ptr != nullptr; }
private:
    T* ptr;
};

class String8 {
public:
    String8() = default;
    String8(const char* str) : mString(str) {}
    const char* string() const { return mString.c_str(); }
    String8& operator+=(const char* str) { mString += str; return *this; }
    static String8 format(const char*, ...) { return String8("formatted"); }
private:
    std::string mString;
};

class unique_fd {
public:
    unique_fd() : mFd(-1) {}
    explicit unique_fd(int fd) : mFd(fd) {}
    int get() const { return mFd; }
    void reset(int fd = -1) { mFd = fd; }
private:
    int mFd;
};

class Fpipe {
public:
    bool init() { return true; }
    unique_fd& readFd() { return mReadFd; }
    unique_fd& writeFd() { return mWriteFd; }
    void close() {}  // no-op
private:
    unique_fd mReadFd, mWriteFd;
};

class ProtoReader {
public:
    bool hasNext() const { return false; }
    char next() { return 0; }
};

class EncodedBuffer {
public:
    void writeHeader(uint32_t, uint32_t) {}
    void writeRawVarint32(uint32_t) {}
    void writeRawByte(uint8_t) {}
    class EditablePosition {
    public:
        size_t pos() const { return 0; }
        void move(size_t) {}
        EditablePosition* rewind() { return this; }
    };
    EditablePosition* wp() { return &pos; }
    void copy(size_t, size_t) {}
    sp<ProtoReader> read() { return sp<ProtoReader>(new ProtoReader()); }
private:
    EditablePosition pos;
};

class FdBuffer {
public:
    status_t readProcessedDataInStream(int, unique_fd&&, unique_fd&&, int64_t, bool) { return NO_ERROR; }
    status_t read(int, int64_t) { return NO_ERROR; }
    status_t readFully(int) { return NO_ERROR; }
    bool timedOut() const { return false; }
    size_t size() const { return 0; }
    bool truncated() const { return false; }
    sp<EncodedBuffer> data() { return sp<EncodedBuffer>(new EncodedBuffer()); }
};

class Section {
public:
    Section(int id, int64_t timeoutMs);
    Section(int id);
    virtual ~Section();
    virtual status_t Execute(ReportWriter* writer) const = 0;
protected:
    int id;
    int64_t timeoutMs;
    String8 name;
};

class WorkerThreadSection : public Section {
public:
    WorkerThreadSection(int id, const int64_t timeoutMs);
    WorkerThreadSection(int id) : Section(id, 0) {}
    ~WorkerThreadSection() override;
    status_t Execute(ReportWriter* writer) const override;
    virtual status_t BlockingCall(unique_fd& fd) const { return NO_ERROR; }
};


namespace android {
namespace os {
    class ParcelFileDescriptor {
    public:
        explicit ParcelFileDescriptor(unique_fd&&) {}
    };
}
}

// --- Add mock callback interface ---
class IIncidentDumpCallback {
public:
    virtual void onDumpSection(const android::os::ParcelFileDescriptor&) = 0;
    virtual ~IIncidentDumpCallback() = default;
};


class BringYourOwnSection : public WorkerThreadSection {
public:
    BringYourOwnSection(int id, const char* customName, const uid_t callingUid,
                        const sp<IIncidentDumpCallback>& callback);
    ~BringYourOwnSection();
    status_t BlockingCall(unique_fd& pipeWriteFd) const override;

private:
    uid_t uid;
    sp<IIncidentDumpCallback> mCallback;
};


struct WorkerThreadData : public std::enable_shared_from_this<WorkerThreadData> {
    const WorkerThreadSection* section;
    Fpipe pipe;
    std::mutex lock;
    bool workerDone;
    status_t workerError;
    explicit WorkerThreadData(const WorkerThreadSection* section);
    virtual ~WorkerThreadData();
};

class String16 {
public:
    String16(const char*) {}
};

class String16List {
public:
    void add(const String16&) {}
};

class IBinder {
public:
    status_t dump(int, const String16List&) { return OK; }
};

class ServiceManager {
public:
    sp<IBinder> checkService(const char*) { return sp<IBinder>(new IBinder()); }
};

inline ServiceManager* defaultServiceManager() {
    static ServiceManager mgr;
    return &mgr;
}

class DumpsysSection : public WorkerThreadSection {
public:
    DumpsysSection(int id, const char* service, ...);
    ~DumpsysSection();
    status_t BlockingCall(unique_fd& pipeWriteFd) const override;
private:
    const char* mService;
    String16List mArgs;
};

class TextDumpsysSection : public WorkerThreadSection {
public:
    TextDumpsysSection(int id, const char* service, ...);
    ~TextDumpsysSection();
    status_t BlockingCall(unique_fd& pipeWriteFd) const override;
private:
    const char* mService;
    String16List mArgs;
};

class CommandSection : public Section {
public:
    CommandSection(int id, const int64_t timeoutMs, const char* command, ...);
    CommandSection(int id, const char* command, ...);
    ~CommandSection();
    status_t Execute(ReportWriter* writer) const override;
private:
    char** mCommand;
};

class ProtoOutputStream {
public:
    uint64_t start(uint32_t) { return 0; }
    void end(uint64_t) {}
    // void write(uint32_t, int) {}
    void write(uint32_t, int64_t) {}
    void write(uint32_t, const char*, size_t) {}
    void write(uint32_t, const std::string&) {}
    bool flush(int) { return true; }
};

namespace android {
namespace base {
    inline std::string StringPrintf(const char*, ...) { return "dummy"; }
    inline bool Readlink(const std::string&, std::string*) { return true; }
}
namespace os {
    struct BackTraceProto {
        struct Stack {
            static const uint32_t PID = 1;
            static const uint32_t DUMP = 2;
            static const uint32_t DUMP_DURATION_NS = 3;
        };
        static const uint32_t TRACES = 1;
    };
}
}

inline bool IsZygote(int) { return false; }
inline bool should_dump_native_traces(const char*) { return true; }
inline std::set<int> get_interesting_hal_pids() { return {}; }

#define LOG_ID_EVENTS 1
#define LOG_ID_STATS 2
#define LOG_ID_SECURITY 3

#define kDebuggerdJavaBacktrace 1
#define kDebuggerdNativeBacktrace 2

inline int dump_backtrace_to_file_timeout(int, int, int, int) { return 0; }

class TombstoneSection : public WorkerThreadSection {
public:
    TombstoneSection(int id, const char* type, const int64_t timeoutMs);
    ~TombstoneSection();
    status_t BlockingCall(unique_fd& pipeWriteFd) const override;
private:
    const char* mType;
};

typedef int log_id_t;
typedef int log_time;

enum LogMode {
    logModeBase = 0,
    ANDROID_LOG_PSTORE = 1 << 0
};

inline log_id_t android_name_to_log_id(const char*) { return 0; }

class LogSection : public WorkerThreadSection {
public:
    LogSection(int id, const char* logID, ...);
    ~LogSection();
    status_t BlockingCall(unique_fd& pipeWriteFd) const override;
private:
    static std::map<log_id_t, log_time> gLastLogsRetrieved;
    log_id_t mLogID;
    bool mBinary;
    int mLogMode;
};

class FileSection : public Section {
public:
    FileSection(int id, const char* filename, const int64_t timeoutMs);
    ~FileSection();
    status_t Execute(ReportWriter* writer) const override;
private:
    const char* mFilename;
    bool mIsSysfs;
};

class GZipSection : public Section {
public:
    GZipSection(int id, const char* filename, ...);
    ~GZipSection();
    status_t Execute(ReportWriter* writer) const override;
private:
    char** mFilenames;
};

class ReportWriter {
public:
    void setSectionStats(const FdBuffer&) {}
    status_t writeSection(const FdBuffer&) { return NO_ERROR; }
    bool truncated() const { return false; }
    void error(const Section*, status_t, const char*) {}
};

extern const char INCIDENT_HELPER[];
extern const char* GZIP[];

// Use inline static dummy for cpp-local conflict resolution
// inline static pid_t fork_execute_incident_helper(int id, Fpipe* stdinPipe, Fpipe* stdoutPipe) {
//     return 0;
// }

char** varargs(const char* first, va_list args);
pid_t fork_execute_cmd(char* const* cmd, Fpipe* stdinPipe, Fpipe* stdoutPipe);
void kill_child(pid_t pid);
status_t wait_child(pid_t pid);
bool section_requires_specific_mention(int sectionId);

inline uint64_t Nanotime() { return 0; }

inline bool ReadFdToString(unique_fd& fd, std::string* out) {
    *out = "dummy output";
    return true;
}

namespace util {
class TextDumpProto {
public:
    static const uint32_t COMMAND = 1;
    static const uint32_t CONTENT = 2;
    static const uint32_t DUMP_DURATION_NS = 3;
};
}

struct GZippedFileProto {
    static const uint32_t FILENAME = 1;
    static const uint32_t GZIPPED_DATA = 2;
};

#define WIRE_TYPE_LENGTH_DELIMITED 2

#endif // SECTION_UAS_LOGIC_H

