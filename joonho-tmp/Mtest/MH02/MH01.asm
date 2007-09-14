****************************************************************
* FILENAME: MH01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
MH01       CSECT
           LR        12,15
           USING     MH01,12
*
* 0x45 * 0xA5 = 0x2C79
*
           L         6,=XL2'45'
           LA        5,DATA
           MH        6,0(5)
           OFADBGREG 6
           BR        14
DATA       DC        XL2'A5'
           END
