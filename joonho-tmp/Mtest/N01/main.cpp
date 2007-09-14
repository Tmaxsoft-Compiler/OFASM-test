#include <stdlib.h>
#include <string.h>
#include <stdio.h>

extern "C"
{
//    extern int N01(char* p_o, char* p_1, char* p_2, char* p_3);
    extern int N01();

    int main()
    {
/*        FILE *fp;
        unsigned char p_0[4]={0,0,0,103}, p_1[4]={0,0,0,254}, p_2[4]={0,0,0,1}, p_3[4]={0,0,0,0};

        fp = fopen("OUT", "w+");

        fprintf(fp, "****** A instruction test 01 *******\n\n");

        fprintf(fp, "Before : p_0 = [0x%02x%02x%02x%02x]\n", p_0[0], p_0[1], p_0[2], p_0[3]);
        fprintf(fp, "         p_1 = [0x%02x%02x%02x%02x]\n", p_1[0], p_1[1], p_1[2], p_1[3]);
        fprintf(fp, "         p_2 = [0x%02x%02x%02x%02x]\n", p_2[0], p_2[1], p_2[2], p_2[3]);
        fprintf(fp, "         p_3 = [0x%02x%02x%02x%02x]\n\n", p_3[0], p_3[1], p_3[2], p_3[3]);

        N01((char*)p_0, (char*)p_1, (char*)p_2, (char*)p_3);

        fprintf(fp, "After  : p_0 = [0x%02x%02x%02x%02x]\n", p_0[0], p_0[1], p_0[2], p_0[3]);
        fprintf(fp, "         p_1 = [0x%02x%02x%02x%02x]\n", p_1[0], p_1[1], p_1[2], p_1[3]);
        fprintf(fp, "         p_2 = [0x%02x%02x%02x%02x]\n", p_2[0], p_2[1], p_2[2], p_2[3]);
        fprintf(fp, "         p_3 = [0x%02x%02x%02x%02x]\n", p_3[0], p_3[1], p_3[2], p_3[3]);

        fclose(fp);
*/
        N01();
        return 0;
    }
}

