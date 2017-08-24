****************************************************************
* FILENAME: XC01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
XC01       CSECT
           LR        12,15
           USING     XC01,12
           LA        5,DATA
           LA        6,DATA2
           XC        0(4,5),0(6)
           L         7,0(5)
           OFADBGREG 7
           LA        5,=XL4'01101000'
           XC        0(4,5),0(6)
           L         7,0(5)
           OFADBGREG 7
           BR        14
DATA       DC        XL4'10110010'
DATA2      DC        XL4'01101000'
           END
