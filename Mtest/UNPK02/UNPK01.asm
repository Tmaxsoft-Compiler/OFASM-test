****************************************************************
* FILENAME: UNPK01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
UNPK01     CSECT
           LR        12,15
           USING     UNPK01,12
           LA        5,DATA
           LA        6,DATA2
           UNPK      0(4,6),0(2,5)
           L         7,DATA2
           OFADBGREG 7
           LA        5,DATA3
           UNPK      0(4,6),0(2,5)
           L         7,DATA2
           OFADBGREG 7
           BR        14
DATA       DC        PL2'-123'
DATA2      DS        ZL4
DATA3      DC        PL2'234'
           END
