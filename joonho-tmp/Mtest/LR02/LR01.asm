****************************************************************
* FILENAME: LR01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
LR01       CSECT
           LR        12,15
           USING     LR01,12
           L         5,DATA
           OFADBGREG 5
           OFADBGREG 6
           LR        6,5
           OFADBGREG 6
           BR        14
DATA       DC        XL4'ABCD1234'
           END
