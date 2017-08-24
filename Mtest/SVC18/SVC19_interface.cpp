#include <stdlib.h>
#include <string.h>

struct ofasm_param
{
    long long length;
    long long elemCnt;
    char *addr;
    char *elemListAddr;
};

extern int OFASM_VM_ENTRY(const char *progName, ofasm_param param[], int paramCnt);

extern "C"
{
int SVC19()
{
    /* declare local arguments */
    int paramCnt;
    ofasm_param param[0];

    /* set params */
    /* set param count */
    paramCnt = 0;

    /* call VM */
    return OFASM_VM_ENTRY("SVC19", param, paramCnt);
}
}
