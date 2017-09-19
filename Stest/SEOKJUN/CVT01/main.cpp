#include <stdlib.h>
#include <string.h>
#include <stdio.h>

extern "C"
{
extern int COPXOR();

int main()
{
	setenv("EXEC_USERID", "cvt", 1);
    setenv("OF_CVT_SYSTEM_NAME", "testsys", 1);
    COPXOR();
    return 0;
}
}
