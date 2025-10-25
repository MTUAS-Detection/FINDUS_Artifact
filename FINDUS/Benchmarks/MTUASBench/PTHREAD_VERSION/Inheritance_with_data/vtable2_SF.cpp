#include <iostream>
#include <pthread.h>
#include <unistd.h>
#include <chrono>
#include <thread>

class Base {
public:
int a=10;
    virtual void func1() {
        std::cout << "Base::func1" << "Data:"<<a << std::endl;
    }
    virtual void func2() {
        std::cout << "Base::func2" << "Data:"<<a << std::endl;
    }
    virtual void func3() {
        std::cout << "Base::func3" << "Data:"<<a << std::endl;
    }
    void func4() {
        std::cout << "Base::func4" << "Data:"<<a << std::endl;
    }
    void func5() {
        std::cout << "Base::func5" << "Data:"<<a << std::endl;
    }
};

class Derived : public Base {
public:
int d=20;
    void func1() override {
        std::cout << "Derived::func1" <<"Data:"<<d<< std::endl;
    }
    void func2() override {
        std::cout << "Derived::func2" << "Data:"<<d<< std::endl;
    }
    void func3() override {
        std::cout << "Derived::func3" << "Data:"<<d<< std::endl;
    }
    void func4()  {
        std::cout << "Derived::func4" << "Data:"<<d<< std::endl;
    }
    void func5()  {
        std::cout << "Derived::func5" <<"Data:"<<d<< std::endl;
    }
};

Base* basePtr = nullptr;
pthread_t t1;

void* threadFunc(void* arg) {
    // std::this_thread::sleep_for(std::chrono::milliseconds(10000)); // Ensure thread starts
    sleep(5);
    if (basePtr) {
        std::cout << "Thread accessing deleted object's func(): "<<"\n";
        basePtr->func1();  // Use-After-Scope issue
    }
    return nullptr;
}

void startThread() {
    Derived DerivedObj;  // Stack allocation
    basePtr = &DerivedObj;
    pthread_create(&t1, nullptr, threadFunc, nullptr);
   
}

int main() {
   
    startThread();
    pthread_join(t1, nullptr);
    return 0;
}