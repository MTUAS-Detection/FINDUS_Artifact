// /* Description: Object x is created on stack (local var) and then passed as reference to thread function thread_func. Here the thread t1 is joined in main function instead of 
//    threadFunction which leads to Use After Scope bug for data object x */

// #include <iostream>
// #include <pthread.h>

// pthread_t t1;

// void* thread_func(void *arg) {
//     int *x = static_cast<int*>(arg);
//     std::cout << "Value of x is:" << *x << "\n";
//     // std::cout<<"Value of x is:";
//     return nullptr;
// }

// void threadFunction() {
//     int x = 10;
//     pthread_create(&t1, nullptr, thread_func, static_cast<void*>(&x));
// }

// int main() {
//     //  int x=10;
//     // t1=std::thread(thread_func);
//     threadFunction();
//     pthread_join(t1, nullptr);
// }
/* Description: Object x is created on stack (local var) and then passed as reference to thread function thread_func. Here the thread t1 is joined in main function instead of 
   threadFunction which leads to Use After Scope bug for data object x */

   #include <iostream>
   #include <pthread.h>
   #include <cassert>
   #include <iostream>
   
   #define ASSERT(expected, expr) do { \
       auto __ret = (expr);            \
       if (__ret != (expected)) {      \
           std::cerr << "ASSERT failed: " #expr << " returned " << __ret << ", expected " << expected \
                     << " (" << __FILE__ << ":" << __LINE__ << ")\n"; \
           assert(__ret == (expected)); \
       } \
   } while (0)
   
   
   pthread_t t1;
   
   void* thread_func(void *arg) {
       int *x = static_cast<int*>(arg);
       std::cout << "Value of x is:" << *x << "\n";
       // std::cout<<"Value of x is:";
       return nullptr;
   }
   
   void threadFunction() {
        int x = 10;
       pthread_create(&t1, nullptr, thread_func, static_cast<void*>(&x));
      
   }
   
   int main() {
       //  int x=10;
       // t1=std::thread(thread_func);
       threadFunction();
       pthread_join(t1, nullptr);
   }