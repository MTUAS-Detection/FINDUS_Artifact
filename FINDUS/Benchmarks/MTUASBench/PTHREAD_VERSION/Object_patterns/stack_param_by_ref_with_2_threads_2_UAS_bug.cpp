/* Description: Object x is created on stack (local var) and then passed as reference to thread function thread_func. Here the thread t1 is joined in main function instead of 
   threadFunction which leads to Use After Scope bug for data object x */

#include <iostream>
#include <pthread.h>

pthread_t t1,t2;

void* thread_func(void *arg) {
    int *x = static_cast<int*>(arg);
    std::cout << "Value of x is:" << *x << "\n";
    // std::cout<<"Value of x is:";
    return nullptr;
}

void threadFunction() {
    int x =10;
    int y=20;
    pthread_create(&t1, nullptr, thread_func, static_cast<void*>(&x));
    pthread_create(&t2, nullptr, thread_func, static_cast<void*>(&y));
}

int main() {
    //  int x=10;
    // t1=std::thread(thread_func);
    threadFunction();
    pthread_join(t1, nullptr);
    pthread_join(t2, nullptr);
}
