#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    extern int BHE01();

    int main()
    {
        BHE01();
        
        return 0;
    }   
}
