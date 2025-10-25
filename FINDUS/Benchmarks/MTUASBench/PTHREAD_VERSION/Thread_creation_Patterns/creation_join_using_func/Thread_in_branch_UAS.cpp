/* Description: Thread creation inside one of the branches of the if loop. Thread is joined in main instead of func1 resulting in UAS*/

#include <iostream>
#include <pthread.h>
#include <atomic>
#include <vector>
// #include <unistd.h>

pthread_t t1;
pthread_t t2;

void* func2(void* yy)
{
    // sleep(5);

    int* y = static_cast<int*>(yy);
    *y = *y + 1;
    std::cout << "The value of y is " << *y << "\n";
    return nullptr;
}

bool signal()
{
    return false;
}

void* func1(void* current)
{
    int* currentValue = static_cast<int*>(current);

    if (signal())
    {
        *currentValue = *currentValue + 1;
        std::cout << "The value of current is " << *currentValue << "\n";
        // Create a new thread inside the `if` block
        pthread_create(&t1, nullptr, func2, current);
    }
    else
    {
        int newval = 30;
        // Create a thread inside the `else` block
        pthread_create(&t1, nullptr, func2, &newval);
        // std::this_thread::sleep_for(std::chrono::milliseconds(3));
    }
    return nullptr;
}

int main()
{
    int x = 1;
    // Create the first thread in main
    pthread_create(&t2, nullptr, func1, &x);

    // Join both threads to ensure the main thread waits for them to finish
    pthread_join(t1, nullptr);
    pthread_join(t2, nullptr);

    return 0;
}
