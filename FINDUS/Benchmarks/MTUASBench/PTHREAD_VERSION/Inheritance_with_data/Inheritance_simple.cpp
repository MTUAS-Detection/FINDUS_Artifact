#include <iostream>
#include <pthread.h>
#include <unistd.h>
using namespace std;
// thread t1;

class Base {
    public:
        int a=10;
         void func()
        {
            std::cout<<"Base"<<"\n";

        }
    
    };
    
    Base* basePtr;
    
    class Derived : public Base {
    public:
        int b=20;
        void func() 
        {
            std::cout<<"Derived:"<<b<<"\n";
        }
      
    };

// void threadFunction(Base *baseRef) {
//     sleep(5);
//     baseRef->display();
// }  
// void* func1(void* args)
// {
//     Derived *d=((Derived*)args);

//     d->func();
//     return NULL;
// }
// pthread_t t1;
int main()  
{   
    
    Derived derivedObj; 
   // basePtr = &derivedObj;    
    // pthread_create(&t1,NULL,func1,&derivedObj);
    // pthread_join(t1,NULL);
   //    std::cout<<basePtr->a<<"\n";
       return 0;
}

