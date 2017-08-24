#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    extern int BL01();

    int main()
    {
        BL01();

        return 0;
    }
}
