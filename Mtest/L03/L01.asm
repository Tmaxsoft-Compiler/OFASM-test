****************************************************************
* FILENAME: L01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
L01        CSECT
           LR        12,15
           USING     L01,12
           L         5,=X'0000ABCD'
           OFADBGREG 5
           BR        14
           END
