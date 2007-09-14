#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    extern int BCT01();

    int main()
    {
        BCT01();
        return 0;
    }
}
