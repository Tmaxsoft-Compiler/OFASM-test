#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    extern int BRC01();
    
    int main()
    {
        BRC01();
        return 0;
    }
}
