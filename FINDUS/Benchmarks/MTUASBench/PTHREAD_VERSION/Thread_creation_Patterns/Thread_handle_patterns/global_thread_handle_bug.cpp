/* Description: Thread handle is initialized globally. Thread is created in function startThread 
running thread function where local value is passed by reference. This is buggy program as the thread join 
is placed in main function by which the scope of startThread function ends much before */

#include <iostream>
#include <pthread.h>

// Global thread handle
pthread_t t;

// Thread function
void* threadFunction(void* arg) {
    int* counter = static_cast<int*>(arg);
    ++(*counter);  // Increment the counter
    std::cout << "Thread is running (global handle), counter = " << *counter << "\n";
    return nullptr;
}

// Function where the thread is created
void startThread() {
    int counter = 0;
    pthread_create(&t, nullptr, threadFunction, &counter);  // Pass counter by pointer
}

int main() {
    startThread();
    pthread_join(t, nullptr);  // Ensure the thread is joined before main continues
    return 0;
}
