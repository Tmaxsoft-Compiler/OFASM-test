#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    extern int BH01();

    int main()
    {
        BH01();

        return 0;
    }
}
