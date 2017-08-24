#include <stdlib.h>
#include <string.h>

struct ofasm_param
{
    long long length;    
    long long elemCnt;
    char *addr;
    char *elemListAddr;
};

extern void OFASM_VM_ENTRY(const char *progName, ofasm_param param[], int paramCnt);

int CALL02(char* p_0, char* p_1, char* p_2)
{
    int paramCnt;
    ofasm_param param[4];
    ofasm_param param1[1];

    /* set param count */
    paramCnt = 0;

    /* call program */
    OFASM_VM_ENTRY("CALL02", param, paramCnt);

    return 1;
}
