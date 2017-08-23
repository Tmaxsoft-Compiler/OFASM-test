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

int CLCL03()
{
    /* call program */
    return OFASM_VM_ENTRY("CLCL03", NULL, 0);
}
