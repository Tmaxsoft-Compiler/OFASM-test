#include <stdlib.h>
#include <string.h>
#include <stdio.h>

extern "C"
{
extern int TEST();

int main()
{
    TEST();
    return 0;
}
}
