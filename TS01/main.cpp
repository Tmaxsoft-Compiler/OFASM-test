#include <stdio.h>

extern "C"
{
    extern int TS01();

    int main()
    {
        TS01();

        return 0;
    }
}
