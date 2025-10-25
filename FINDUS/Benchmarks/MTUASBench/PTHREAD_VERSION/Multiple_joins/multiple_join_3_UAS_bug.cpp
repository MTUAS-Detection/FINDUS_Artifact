#include <iostream>
#include <pthread.h>
#include<unistd.h>

pthread_t t1,t2;
pthread_t tid[5];
void* thread_func(void *arg) {
    sleep(2);
    int *x = static_cast<int*>(arg);
    std::cout << "Value of x is:" << *x << "\n";
    // std::cout<<"Value of x is:";
    return nullptr;
}

void threadFunction() {
    int x = 10,y=20;

   for(int i=1;i<4;i++)
   {
    pthread_create(&tid[i],nullptr,thread_func,&x);

   }
    if(x==20)
    {
        if(y==20)
        {
           
            for(int i=1;i<=3;i++)
            {
                pthread_join(tid[i],nullptr);

            }

        }
        else 
        {
            // pthread_join(t1, nullptr);

        
        }
      

    }
    else 
    {
        // pthread_join(t2, nullptr);
    
    }
}

int main() {
    //  int x=10;
    // t1=std::thread(thread_func);
    threadFunction();
        for(int i=1;i<=3;i++)
            {
                pthread_join(tid[i],nullptr);

            }
}
