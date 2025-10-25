/* Description: Two threads are spawned t1 and t2 in spawnThreads function depending on value of x.
One thread is joined in if block preventing Use After Scope bug whereas the other thread is joined inside
the main function leading to potential Use After Scope. For bug to occur input any value other than 10 */

#include <iostream>
#include <pthread.h>
using namespace std;

pthread_t t1, t2;

void* UseOfData(void* arg)
{
    int* x = (int*)arg;
    cout << "Data sent:" << *x << endl;
    return nullptr;
}

void spawnThreads()
{
    int x;
    // cin >> x;
    x=20;
    if (x == 10)
    {
        // Create thread t1 and join it inside the if block to avoid Use After Scope
        pthread_create(&t1, nullptr, UseOfData, &x);
        pthread_join(t1, nullptr);
    }
    else
    {
        x = 100;
        // Create thread t2 without joining it inside spawnThreads, leading to potential Use After Scope
        pthread_create(&t2, nullptr, UseOfData, &x);
        // pthread_join(t2, nullptr); // Commented to mimic original behavior
    }
}

int main()
{
    spawnThreads();
    // Join thread t2 in the main function, which may lead to Use After Scope
    pthread_join(t2, nullptr);
    return 0;
}
