#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    extern int BC01();

    int main()
    {
        BC01();
        return 0;    
    }
}
