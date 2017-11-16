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

int BCTR01(char *p0, char *p1)
{
    /* declare local arguments */
    int rc;
    int paramCnt;
    ofasm_param param[2];

    /* set params */
    param[0].length = 10;
    param[0].addr = p0;
    param[0].elemListAddr = NULL;
    param[0].elemCnt = 0;

    param[1].length = 4;
    param[1].addr = p1;
    param[1].elemListAddr = NULL;
    param[1].elemCnt = 0;

    /* set param count */
    paramCnt = 2;

    /* call VM */
    rc = OFASM_VM_ENTRY("BCTR01", "BCTR01", param, paramCnt);
    return rc;
}

}
