#include <stdlib.h>
#include <stdio.h>

extern "C"
{
    extern int BE01();

    int main()
    {
        BE01();
        
        return 0;   
    }
}
