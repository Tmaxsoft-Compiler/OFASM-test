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

int TEST()
{
    /* declare local arguments */
    int rc;
    int paramCnt;
    ofasm_param param[0];

    /* set param count */
    paramCnt = 0;

    /* call VM */
    rc = OFASM_VM_ENTRY("TEST", "TEST", param, paramCnt);
    return rc;
}

}
