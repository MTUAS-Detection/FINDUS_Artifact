// #include <iostream>
// #include <pthread.h>
// #include<unistd.h>
// using namespace std;

// pthread_t t1,t2;

// void* thread_func(void *arg) {
//     sleep(10);
//     int *x = static_cast<int*>(arg);
//     std::cout << "Value of x is:" << *x << "\n";
//     // std::cout<<"Value of x is:";
//     return nullptr;
// }

// void threadFunction() {
//     int x = 10;
//     pthread_create(&t1, nullptr, thread_func, &x);
//     pthread_create(&t2, nullptr, thread_func, &x);
//     if(x==20)
//     {
//         pthread_join(t1, nullptr);
//         pthread_join(t2, nullptr);

//     }
    
   
//     cout<<"Func ended"<<endl;
// }

// int main() {
//     //  int x=10;
//     // t1=std::thread(thread_func);
//     threadFunction();
//     pthread_join(t1, nullptr);
// }
#include <iostream>
#include <pthread.h>
#include<unistd.h>
using namespace std;

pthread_t t1,t2;

void* thread_func(void *arg) {
    sleep(10);
    int *x = static_cast<int*>(arg);
    std::cout << "Value of x is:" << *x << "\n";
    // std::cout<<"Value of x is:";
    return nullptr;
}

void threadFunction() {
    int x = 10;
    // pthread_create(&t1, nullptr, thread_func, &x);
    pthread_create(&t2, nullptr, thread_func, &x);
    if(x==20)
    {
        pthread_join(t1, nullptr);


    }
    pthread_join(t2, nullptr);

   
    cout<<"Func ended"<<endl;
}

int main() {
    //  int x=10;
    // t1=std::thread(thread_func);
    threadFunction();
    pthread_join(t1, nullptr);
}
