#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>

struct ofasm_param
{
    long long length;
    long long elemCnt;
    char *addr;
    char *elemListAddr;
};

extern int OFASM_VM_ENTRY(const char *progName, ofasm_param param[], int paramCnt); // DEPRECATED
extern int OFASM_VM_ENTRY(const char *progName, const char *entryName, ofasm_param param[], int paramCnt);

extern "C"
{
int A01(char *p0, char *p1, char *p2, char *p3)
{
    /* declare local arguments */
    int paramCnt;
    ofasm_param param[4];

    /* set params */
    param[0].length = 4;
    param[0].addr = p0;
    param[0].elemListAddr = NULL;
    param[0].elemCnt = 0;

    param[1].length = 4;
    param[1].addr = p1;
    param[1].elemListAddr = NULL;
    param[1].elemCnt = 0;

    param[2].length = 4;
    param[2].addr = p2;
    param[2].elemListAddr = NULL;
    param[2].elemCnt = 0;

    param[3].length = 4;
    param[3].addr = p3;
    param[3].elemListAddr = NULL;
    param[3].elemCnt = 0;

    /* set param count */
    paramCnt = 4;

    /* call VM */
    return OFASM_VM_ENTRY("A01", param, paramCnt);
}
}
