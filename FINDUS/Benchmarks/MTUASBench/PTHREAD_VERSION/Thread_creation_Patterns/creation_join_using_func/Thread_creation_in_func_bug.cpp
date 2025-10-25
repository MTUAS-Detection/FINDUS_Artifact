/* Description: Thread creation inside a function createThread(). Local variable is passed as reference to 
   thread running the function task. As the thread is joined at wrong location (inside main) it creates a Use After 
   Scope bug */

#include <iostream>
#include <pthread.h>

pthread_t t;
void* task(void* arg) {
    int* ref = static_cast<int*>(arg);  // Cast arg to an int pointer
    *ref += 10;
    std::cout << "Task running in thread, modified value: " << *ref << "\n";
    return nullptr;
}

void createThread() {
    int localVar = 5;
    
    std::cout << "Before thread, localVar: " << localVar << "\n";
    
    pthread_create(&t, nullptr, task, &localVar);  // Create thread and pass the address of localVar
    
    // Join the thread inside the createThread function to avoid scope issues
  
    
    std::cout << "After thread, localVar: " << localVar << "\n";
}

int main() {
    createThread();  // Create the thread and join inside createThread()
    pthread_join(t, nullptr);
    return 0;
}
