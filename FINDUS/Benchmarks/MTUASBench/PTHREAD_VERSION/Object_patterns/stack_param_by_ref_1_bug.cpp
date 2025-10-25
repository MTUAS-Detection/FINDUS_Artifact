/* Description: Object x is created on stack (local var) and then passed as reference to thread function thread_func.
The thread is joined outside the scope of object creation which results in UAS bug*/

#include <iostream>
#include <pthread.h>
#include <bits/stdc++.h>
#include <unistd.h>
using namespace std;

pthread_t t1;

void* thread_func(void *arg) {
    int *y = static_cast<int*>(arg);
    sleep(10);
    //   cout<<"Mem loc:"<<y<<endl;
    std::cout << "Value of y is:" << *y << "\n";
    return nullptr;
}

int main() {
    int a;
    // std::cin >> a;
    a=56;
    
    if (a == 56) {
        int x = 10;
        // cout<<"Mem loc:"<<&x<<endl;
        pthread_create(&t1, nullptr, thread_func, &x);
    }
    std::cout << "Scope over" << std::endl;
    
    pthread_join(t1, nullptr);
}
