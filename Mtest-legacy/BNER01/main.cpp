#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    extern int BNER01();

    int main()
    {
        BNER01();

        return 0;
    }
}
