#include <iostream>
#include <pthread.h>
#include<unistd.h>

pthread_t t1,t2,t3,t4,t5;

void* thread_func(void *arg) {
    sleep(2);
    int *x = static_cast<int*>(arg);
    std::cout << "Value of x is:" << *x << "\n";
    // std::cout<<"Value of x is:";
    return nullptr;
}
void joinThread2(pthread_t& t) {
    std::cout << "Joining thread...\n";
    pthread_join(t, nullptr);  // Join the thread to ensure it finishes
    std::cout << "Thread joined successfully.\n";
}

void joinThread(pthread_t& t) {
    std::cout << "Joining thread...\n";
    joinThread2(t);  // Join the thread to ensure it finishes
    std::cout << "Thread joined successfully.\n";
}

void threadFunction() {
    int x = 10,y=20;
    pthread_create(&t1, nullptr, thread_func, &x);
    pthread_create(&t2, nullptr, thread_func, &x);
    if(x==20)
    {
         pthread_create(&t3, nullptr, thread_func, &x);
        if(y==20)
        {
             pthread_create(&t4, nullptr, thread_func, &x);
             if(y==30)
             {
                pthread_join(t4, nullptr);

             }
           

        }
        
        else 
        {
            pthread_join(t1, nullptr);
             
            if(x==10)
            {
                pthread_join(t3, nullptr);     pthread_join(t4, nullptr);
            }
            else {
                 pthread_join(t3, nullptr);
          
            }

        
        }
          pthread_join(t2, nullptr);
      
          joinThread(t4);
    }
    else 
    {
        pthread_join(t2, nullptr);
        pthread_join(t3, nullptr);
    
    }
     pthread_join(t3, nullptr);
    //    joinThread(t4);
    // for(int i=0, joinThread(t4);i<10;i++);
    switch(x)
    {
        case 10: joinThread(t4);
        // case 11: joinThread(t4);
        default: 
        {
            
        }
        // joinThread(t4);
    }
}

int main() {
    //  int x=10;
    // t1=std::thread(thread_func);
    threadFunction();
    pthread_join(t1, nullptr);
}
