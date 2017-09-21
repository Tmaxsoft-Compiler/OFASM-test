#include <stdlib.h>
#include <string.h>

extern int SVC48(char* p_0, char* p_1, char* p_2);

int main(){
    char *p_0 = (char *)malloc(sizeof(char)*7);
    char *p_1_0 = (char *)malloc(sizeof(char)*7);
    char *p_1 = (char *)&p_1_0;
    char *p_2 = (char*) malloc(sizeof(char)*3);
    strcpy(p_0,"HELLO ");
    strcpy(p_1_0,"WORLD ");
    strcpy(p_2,"!!");

    SVC48(p_0, p_1, p_2);
   
    return 0;
}
