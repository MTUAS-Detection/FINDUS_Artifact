
#include <iostream>
#include <pthread.h>
#include <unistd.h> // for sleep
using namespace std;
int *gPtr1,*gPtr2;
// int check=0;
pthread_t t1,t2;
void* t1_func(void* arg) {
    int local1 = 10;
    int local2 = 20;
    gPtr1 = &local1;
    gPtr2 = &local2;
    // check=1;
    printf("T1 assigned: %d\n", local1);
    printf("T1 assigned: %d\n", local2);

    return NULL;
}

void* t2_func(void* arg) {
    sleep(1); // Ensure T1 writes first
    // while(!check);
    printf("T2 read: %d\n", *gPtr1);
    printf("T2 read: %d\n", *gPtr2);
    return NULL;
}

int main() {
    pthread_create(&t1, NULL, t1_func, NULL);
    pthread_create(&t2, NULL, t2_func, NULL);
    pthread_join(t1, NULL); // T2 => T1
    pthread_join(t2, NULL);
    
    return 0;
}
