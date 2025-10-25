#include "TestExecution_pthread_UAS_logic.h"
void* execute_thread_func(void* arg) {
    ExecuteThreadData* data = static_cast<ExecuteThreadData*>(arg);
    data->self->dummyExecution();

    if (data->self->getErrorStatus() == ErrorStatus::NONE) {
        data->self->getPreparedModelV1_0()->execute(data->request, data->callback_v1_0);
    } else {
        data->callback_v1_0->notify(convertToV1_0(data->self->getErrorStatus()));
    }

    delete data;
    return nullptr;
}

Return<ErrorStatus> ExecutionBurstController::execute(
    const V1_0::Request& request,
    const sp<V1_0::IExecutionCallback>& callback) {

    CHECK(mPreparedModelV1_0 != nullptr);

    ExecuteThreadData* data = new ExecuteThreadData{this, request, callback};

    pthread_t thread;
    pthread_create(&thread, nullptr, execute_thread_func, data);
    pthread_detach(thread);

    return ErrorStatus::NONE;
}

// Dummy test wrapper for execute
void testExecuteFunction() {
    // Create a dummy request
    V1_0::Request request = {
        .inputs = {},
        .outputs = {},
        .pools = {}
    };

    // Create a dummy callback
    sp<V1_0::IExecutionCallback> callback = new V1_0::DummyExecutionCallback();

    // Create controller instance
    ExecutionBurstController controller;

    // Call execute
    controller.execute(request, callback);
}
