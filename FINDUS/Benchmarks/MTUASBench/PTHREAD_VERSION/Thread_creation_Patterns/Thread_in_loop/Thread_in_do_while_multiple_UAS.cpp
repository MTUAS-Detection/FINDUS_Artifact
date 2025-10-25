/* Description: 50 threads are created in do while loop. First 40 threads are created in else block and last 10 in if block. The threads are joined immediately
inside the if-else block avoiding the potential Use After Scope bugs */

#include <iostream>
#include <pthread.h>
#include <vector>

using namespace std;

// Thread function for task 1 (sharedData is passed by pointer)
void* threadTask(void* arg) {
    int* sharedData = static_cast<int*>(arg);
    (*sharedData)++; // Update shared data
    std::cout << "Thread updated sharedData to " << *sharedData << "\n";
    return nullptr;
}

// Thread function for task 2 (sharedData is passed by value)
void* threadTask2(void* arg) {
    int sharedData = *static_cast<int*>(arg);
    sharedData++; // Update shared data
    std::cout << "Thread updated sharedData to " << sharedData << "\n";
    return nullptr;
}

int main() {
    std::vector<pthread_t> threads;
    int sharedData = 0;
    int id = 1;

    // Create thread chain with data dependency
    do {
        pthread_t tid;
        if (sharedData > 1 && sharedData < 10) {
            // Pass sharedData by value for threadTask2
            pthread_create(&tid, nullptr, threadTask2, &sharedData);
            threads.push_back(tid);
            sharedData++;
        } else {
            // Pass sharedData by pointer for threadTask
            pthread_create(&tid, nullptr, threadTask, &sharedData);
            std::cout << tid << " is joining" << std::endl;
            pthread_join(tid, nullptr); // Join immediately inside the else block
        }
    } while (sharedData < 50);

    for (size_t i = 2; i < threads.size(); i++) {
        std::cout << threads[i] << " is joining" << std::endl;
        pthread_join(threads[i], nullptr);
    }

    std::cout << "Final sharedData: " << sharedData << "\n";
    return 0;
}
