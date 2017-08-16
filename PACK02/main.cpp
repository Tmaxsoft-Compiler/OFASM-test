#include <stdlib.h>
#include <string.h>
#include <stdio.h>

extern "C"
{
extern int LGR01(char* p_0, char* p_1);

int main()
{
    FILE *fp;
    unsigned char p_0[8]={0}, p_1[8]={0};
    int i, temp=-1;

    for(i=0; i<8; i++)
    {
        p_0[i] = 0xf0+i;
        p_1[i] = 0xf0+i+i;
    }

    LGR01((char*)p_0, (char*)p_1);
   
    return 0;
}
}
