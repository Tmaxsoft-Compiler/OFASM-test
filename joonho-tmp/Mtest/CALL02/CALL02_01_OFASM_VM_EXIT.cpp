#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>

extern "C"
{

extern int CALL02_01();

int CALL02_01_OFASM_VM_EXIT()
{
    /* call VM */
    int rc = CALL02_01();
    return rc;
}

}
