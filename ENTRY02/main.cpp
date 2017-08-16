#include <stdlib.h>
#include <string.h>

extern "C"{
extern int ENTRY02A(char* p1, char* p2, char* p3);
extern int ENTRY02B();
}

int main(){
    char *p1, *p2, *p3;
    p1 = (char*)malloc(5);
    p2 = (char*)malloc(8);
    p3 = (char*)malloc(14);
    ENTRY02A(p1, p2, p3);
    ENTRY02A(p1, p2, p3);
    ENTRY02B();   
    return 0;
}
