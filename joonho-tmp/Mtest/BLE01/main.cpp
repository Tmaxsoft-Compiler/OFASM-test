#include <stdio.h>
#include <stdlib.h>

extern "C"
{
    extern int BLE01();

    int main()
    {
        BLE01();

        return 0;
    }
}
