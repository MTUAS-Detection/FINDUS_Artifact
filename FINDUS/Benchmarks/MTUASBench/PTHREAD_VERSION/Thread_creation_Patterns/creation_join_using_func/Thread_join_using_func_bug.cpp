/* Description: Passing thread handle as parameter to join the thread.
   Here joinThread function is called inside main(), which may lead to potential Use After Scope issues. */

#include <iostream>
#include <pthread.h>

// Global thread handle
pthread_t t1;

// Function that will be executed by the thread
void* threadTask(void* arg) {
    int* x = static_cast<int*>(arg);
    std::cout << "Thread is running...\n";
    std::cout << "Value of x is " << *x << std::endl;
    std::cout << "Thread has finished.\n";
    return nullptr;
}

// Function that takes a thread handle and joins the thread
void joinThread(pthread_t t) {
    std::cout << "Joining thread...\n";
    pthread_join(t, nullptr);  // Join the thread to ensure it finishes
    std::cout << "Thread joined successfully.\n";
}

void createThread(int &x) {
   
    // Create a thread and pass the address of x
    pthread_create(&t1, nullptr, threadTask, &x);
    std::cout << "Function createThread went out of scope.\n";
}

int main() {
     int x = 100;
    createThread(x);

    // Pass the thread handle (t1) to another function to join it
    joinThread(t1);  // Passing the thread handle as a reference

    return 0;
}
