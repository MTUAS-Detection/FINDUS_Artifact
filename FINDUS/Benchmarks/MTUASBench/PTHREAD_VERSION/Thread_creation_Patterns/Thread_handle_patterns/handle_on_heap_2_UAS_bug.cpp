/* Description: Thread handle created on heap using new keyword in main function. 
Same handle used to run threadFunction passing counter as reference */

#include <iostream>
#include <pthread.h>
#include<unistd.h>

void* threadFunction(void* arg) {
  
    int* counter = static_cast<int*>(arg);
    std::cout << "Thread is running, counter = " << *counter << "\n";
    return nullptr;
}

int main() {
    int counter1 = 5,counter2=10;

    pthread_t* t1 = new pthread_t;  // Create a new thread handle
    pthread_t* t2 = new pthread_t;  // Create a new thread handle

    // Create a new thread
    pthread_create(t1, nullptr, threadFunction, &counter1);
    pthread_create(t2, nullptr, threadFunction, &counter2);

    // Ensure the thread is joined before proceeding
    // if (pthread_join(*t, nullptr) != 0) {
    //     std::cerr << "Error joining thread\n";
    // }


    delete t1;  // Clean up dynamically allocated thread handle
    delete t2;  // Clean up dynamically allocated thread handle

    std::cout << "Main function ends\n";
    return 0;
}
