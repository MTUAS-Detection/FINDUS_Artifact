#pragma once

#include <vector>
#include <pthread.h>
#include <cassert>
#include <memory>

// Dummy macro replacement for CHECK
#define CHECK(x) assert(x)

// Dummy error status enum
// Dummy definition of android::sp
template <typename T>
class sp {
public:
    T* ptr;

    sp() : ptr(nullptr) {}
    sp(T* p) : ptr(p) {}
    sp(const sp& other) : ptr(other.ptr) {}
    sp& operator=(T* p) {
        ptr = p;
        return *this;
    }
    T* operator->() const { return ptr; }
    T& operator*() const { return *ptr; }
    operator bool() const { return ptr != nullptr; }
};

enum class ErrorStatus {
    NONE,
    GENERAL_FAILURE
};

// Dummy wrapper for Return<T>
template <typename T>
class Return {
public:
    T value;
    Return(T v = {}) : value(v) {}
    operator T() const { return value; }
};

// Specialization for void
template <>
class Return<void> {
public:
    Return() {}
    operator void() const {}
};

// Namespace and request struct
namespace V1_0 {
    struct Request {
        std::vector<int> inputs;
        std::vector<int> outputs;
        std::vector<int> pools;
    };

    struct IExecutionCallback {
        virtual Return<void> notify(ErrorStatus status) = 0;
        virtual ~IExecutionCallback() = default;
    };

    // Fully defined dummy callback class
    struct DummyExecutionCallback : public IExecutionCallback {
        Return<void> notify(ErrorStatus) override {
            return {};
        }
    };
}

// Forward declaration
class ExecutionBurstController;

// Data passed to thread
struct ExecuteThreadData {
    ExecutionBurstController* self;
    V1_0::Request request;
    sp<V1_0::IExecutionCallback> callback_v1_0;
};

// Dummy model interface
struct PreparedModel {
    Return<ErrorStatus> execute(const V1_0::Request&, const sp<V1_0::IExecutionCallback>&) {
        return ErrorStatus::NONE;
    }
};

// Main controller class
class ExecutionBurstController {
public:
    Return<ErrorStatus> execute(const V1_0::Request& request,
                                const sp<V1_0::IExecutionCallback>& callback);

    void dummyExecution() {} // No-op

    ErrorStatus getErrorStatus() const { return ErrorStatus::NONE; }

    PreparedModel* getPreparedModelV1_0() const { return mPreparedModelV1_0; }

private:
    PreparedModel* mPreparedModelV1_0 = new PreparedModel();
};

// Dummy conversion function
inline ErrorStatus convertToV1_0(ErrorStatus status) {
    return status;
}

// Test function
void testExecuteFunction();