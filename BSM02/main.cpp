#include <stdlib.h>
#include <string.h>
#include <stdio.h>

extern "C"
{
extern int BSM02(char* p_0, char* p_1);

int main()
{
    FILE *fp;
    unsigned char p_0[4]={0}, p_1[4]={0};
    p_0[3] = 1;
    p_1[3] = 4;

    fp = fopen("OUT", "w+");
    
    fprintf(fp, "before: p_0 = [0x%02x%02x%02x%02x], p_1 = [0x%02x%02x%02x%02x]\n",
        p_0[0], p_0[1], p_0[2], p_0[3],
        p_1[0], p_1[1], p_1[2], p_1[3]
     );
    BSM02((char*)p_0, (char*)p_1);
    fprintf(fp, "after:  p_0 = [0x%02x%02x%02x%02x], p_1 = [0x%02x%02x%02x%02x]\n",
        p_0[0], p_0[1], p_0[2], p_0[3],
        p_1[0], p_1[1], p_1[2], p_1[3]
     );
   
    fclose(fp);
    return 0;
}
}
