****************************************************************
* FILENAME: SLDA01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
SLDA01     CSECT
           LR        12,15
           USING     SLDA01,12
           L         6,DATA
           L         7,DATA2
           OFADBGREG 6
           OFADBGREG 7
           SLDA      6,31(0)
           OFADBGREG 6
           OFADBGREG 7
           BR        14
DATA       DC        XL4'7F0A72'
DATA2      DC        XL4'FEDCBA98'
           END
