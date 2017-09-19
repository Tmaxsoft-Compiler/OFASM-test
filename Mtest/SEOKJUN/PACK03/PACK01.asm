****************************************************************
* FILENAME: PACK01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
PACK01     CSECT
           LR        12,15
           USING     PACK01,12
           LA        5,DATA
           PACK      0(4,5),0(4,5)
           L         6,0(5)
           OFADBGREG 6 

           BR        14
DATA       DC        XL4'F1F2F3C4'
           END
