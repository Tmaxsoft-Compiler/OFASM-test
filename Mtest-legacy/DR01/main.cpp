#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    extern int DR01();

    int main()
    {
        DR01();

        return 0;
    }
}
