****************************************************************
* FILENAME: D01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
D01        CSECT
           LR        12,15
           USING     D01,12
           LG        7,DATA
           LA        8,DATA2
           OFADBGREG 7
           D         6,0(8)
           OFADBGREG 6
           OFADBGREG 7

           BR        14
DATA       DC        XL8'8DE'
DATA2      DC        XL4'32'
           END
