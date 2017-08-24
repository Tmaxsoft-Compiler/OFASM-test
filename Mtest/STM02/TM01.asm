****************************************************************
* FILENAME: TM01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
TM01       CSECT
           LR        12,15
           USING     TM01,12
           LA        5,DATA
           TM        5,B'11000011'
           OFADBGREG 5
*           LA        5,DATA2
*           TM        5,B'11000011'
*           OFADBGREG 5
*           LA        5,DATA3
*           TM        5,B'11000011'
*           OFADBGREG 5
           BR        14
DATA       DC        B'11111011'
*DATA       DC        X'FB'
*DATA2      DC        X'B9'
*DATA3      DC        X'3C'
           END
