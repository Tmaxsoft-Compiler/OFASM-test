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

int ALY01(char* p_0, char* p_1, char* p_2)
{
    int paramCnt;
    ofasm_param param[4];
    ofasm_param param1[1];

    /* param[0] */
    param[0].length = 6;
    param[0].addr = p_0;
    param[0].elemListAddr = NULL;
    param[0].elemCnt = 0;

    /* param[1] */
    param[1].length = sizeof(int);
    param[1].addr = p_1;
    param[1].elemListAddr = (char*)&param1;
    param[1].elemCnt = 1;

    /* param[1][0] */
    param1[0].length = 6;
    param1[0].addr = *(char**)p_1;
    param1[0].elemListAddr = NULL;
    param1[0].elemCnt = 0;

    /* param[2] */
    param[2].length = 2;
    param[2].addr = p_2;
    param[2].elemListAddr = NULL;
    param[2].elemCnt = 0;

    /* set param count */
    paramCnt = 3;

    /* call program */
    OFASM_VM_ENTRY("ALY01", param, paramCnt);

    return 1;
}
