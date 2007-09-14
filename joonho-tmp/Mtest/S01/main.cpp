#include <stdlib.h>
#include <string.h>
#include <stdio.h>

extern "C"
{
extern int S01();

int main()
{
    FILE *fp;

    S01();

    return 0;
}
}
