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

int II01()
{
    int rc;
    int paramCnt;
    ofasm_param param[4];
    ofasm_param param1[1];

    /* set param count */
    paramCnt = 0;

    /* call program */
    /* TODO: check return value */
    rc = OFASM_VM_ENTRY("II01", param, paramCnt);

    return rc;
}
