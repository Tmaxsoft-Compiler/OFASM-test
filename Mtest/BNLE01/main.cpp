#include <stdio.h>
#include <stdlib.h>

extern "C"
{
    extern int BNLE01();
    
    int main()
    {
        BNLE01();
        
        return 0;
    }
}
