#include <stdlib.h>
#include <string.h>
#include <stdio.h>

extern "C"
{
extern int STCKE01(char* p_0);

int main()
{
    FILE *fp;
    unsigned char p_0[4]={0};

    fp = fopen("OUT", "w+");
    
    fprintf(fp, "before: p_0 = [0x%02x%02x%02x%02x]\n", p_0[0], p_0[1], p_0[2], p_0[3]);
    STCKE01((char*)p_0);
    fprintf(fp, "after:  p_0 = [0x%02x%02x%02x%02x]\n", p_0[0], p_0[1], p_0[2], p_0[3]);
   
    fclose(fp);
    return 0;
}
}
