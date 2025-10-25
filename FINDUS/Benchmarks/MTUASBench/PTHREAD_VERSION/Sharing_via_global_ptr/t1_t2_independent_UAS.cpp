
#include <iostream>
#include <pthread.h>
#include <unistd.h> // for sleep
using namespace std;
int *gPtr;
// int check=0;
pthread_t t1,t2;
void* t1_func(void* arg) {
    int local = 10;
    gPtr = &local;
    // check=1;
    printf("T1 assigned: %d\n", local);
   
    return NULL;
}

void* t2_func(void* arg) {
    sleep(1); // Ensure T1 writes first
    // while(!check);
    printf("T2 read: %d\n", *gPtr);
    return NULL;
}

int main() {
    pthread_create(&t1, NULL, t1_func, NULL);
    pthread_create(&t2, NULL, t2_func, NULL);
    pthread_join(t1, NULL); // T2 => T1
    pthread_join(t2, NULL);
    
    return 0;
}
