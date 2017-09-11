*************************************************
* FILENAME : N03.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 113
*************************************************
        MACRO
        MAC_N       &VALUE1,&VALUE2
        L           2,&VALUE1
        N           2,&VALUE2
        OFADBGREG   2
        MEND
N03     CSECT
        LR          12,15
        USING       N03,12
* 32bits input, 32bits input
        MAC_N       DATA1,DATA2
* 32bits input, 32bits input
        MAC_N       DATA1,DATA3
* 32bits input, over 32bits input
        MAC_N       DATA4,DATA5
        MAC_N       DATA4,DATA6
* 32bits input, over 32bits input
        MAC_N       DATA4,DATA7
        MAC_N       DATA4,DATA8
        BR          14
        END
DATA1   DC          X'FFFFFFFF'
DATA2   DC          X'00000000'
DATA3   DC          X'00000001'
DATA4   DC          X'F0F0F0F0'
DATA5   DC          X'0F0F0F0F0F'
DATA6   DC          X'0F0F0F0F0'
DATA7   DC          X'F0F0F0F0F0'
DATA8   DC          X'F0F0F0F0F'
