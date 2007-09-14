#include <stdio.h>
#include <stdlib.h>

extern "C"
{
    extern int XI01();

    int main()
    {
        XI01();

        return 0;
    }
}
