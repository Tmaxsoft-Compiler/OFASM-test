#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    extern int BNM01();

    int main()
    {
        BNM01();
        
        return 0;
    }
}
