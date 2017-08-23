#include <stdlib.h>
#include <string.h>
#include <stdio.h>

extern "C"
{
extern int CKSM01(char* p_0, char* p_1);

int main()
{
    FILE *fp;
    unsigned char p_0[8]={0}, p_1[8]={0};
    int i;

    for(i=0; i<8; i++)
    {
        p_0[i] = 0x11+i;
        p_1[i] = 0x22+i+i;
    }

    fp = fopen("OUT", "w+");
    
    fprintf(fp, "before: p_0 = [0x%02x%02x%02x%02x%02x%02x%02x%02x], p_1 = [0x%02x%02x%02x%02x%02x%02x%02x%02x]\n",
        p_0[0], p_0[1], p_0[2], p_0[3],
        p_0[4], p_0[5], p_0[6], p_0[7],
        p_1[0], p_1[1], p_1[2], p_1[3],
        p_1[4], p_1[5], p_1[6], p_1[7]
     );
    CKSM01((char*)p_0, (char*)p_1);
    fprintf(fp, "after:  p_0 = [0x%02x%02x%02x%02x%02x%02x%02x%02x], p_1 = [0x%02x%02x%02x%02x%02x%02x%02x%02x]\n",
        p_0[0], p_0[1], p_0[2], p_0[3],
        p_0[4], p_0[5], p_0[6], p_0[7],
        p_1[0], p_1[1], p_1[2], p_1[3],
        p_1[4], p_1[5], p_1[6], p_1[7]
     );
   
    fclose(fp);
    return 0;
}
}
