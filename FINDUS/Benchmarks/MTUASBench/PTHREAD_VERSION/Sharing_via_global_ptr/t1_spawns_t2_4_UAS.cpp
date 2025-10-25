#include <iostream>
#include <pthread.h>
#include <unistd.h> // for sleep
using namespace std;
int *gPtr1,*gPtr2;
pthread_t t1,t2,t3;
void* t2_func(void* arg) {
    printf("T2 read: %d\n", *gPtr1);
    printf("T2 read: %d\n", *gPtr2);
    return NULL;
}

void* t1_func(void* arg) {
    int local1 = 30;
    int local2 = 40;
    gPtr1 = &local1;
    gPtr2 = &local2;
    pthread_create(&t2, NULL, t2_func, NULL);
    pthread_create(&t3, NULL, t2_func, NULL);
    // pthread_join(t2, NULL); // T2 => T1
    return NULL;
}

int main() {
    pthread_create(&t1, NULL, t1_func, NULL);
    pthread_join(t1, NULL);
    return 0;
}
