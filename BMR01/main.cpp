#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    extern int BMR01();

    int main()
    {
        BMR01();

        return 0;
    }
}
