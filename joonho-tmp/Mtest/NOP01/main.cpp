#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int NOP01();

int main()
{
    int rc1, rc2;

    rc1 = NOP01();
    rc2 = NOP01();

    return (rc1 == rc2 ? 1 : 0);
}
