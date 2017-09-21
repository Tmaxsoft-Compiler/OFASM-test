#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    extern int BNHE01();
    
    int main()
    {
        BNHE01();
        
        return 0;
    }
}
