/* Description: Thread creation inside one of the branches of the if loop */

#include <iostream>
#include <pthread.h>
#include <atomic>
#include <vector>
#include<unistd.h>

pthread_t t1;
pthread_t t2;

void* func2(void* yy)
{
    int* y = static_cast<int*>(yy);
    *y = *y + 1;
    std::cout << "The value of newval is " << *y << "\n";
    pthread_join(t2, nullptr);
    return nullptr;
}

bool signal()
{
    return true;
}

void* func1(void* current)
{
    int* currentValue = static_cast<int*>(current);

    if (signal())
    {
        *currentValue = *currentValue + 1;
        std::cout << "The value of x is " << *currentValue << "\n";
        // Create a new thread inside the `if` block

        pthread_join(t1, nullptr);
    }
  
    return nullptr;
}

int main()
{
    int x = 30;
    int newval = 30;
    // Create the first thread in main
    pthread_create(&t1, nullptr, func1, &x);
    pthread_create(&t2, nullptr, func2, &newval);

    // Join both threads to ensure the main thread waits for them to finish
   sleep(5);
 

    return 0;
}
