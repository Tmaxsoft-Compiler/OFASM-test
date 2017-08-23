****************************************************************
* FILENAME: CH01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
CH01       CSECT
           LR        12,15
           USING     CH01,12
           LH         5,DATA
*
* CC = 0
           CH       5,=H'1'
           OFADBGREG 5
*
* CC = 1
           CH        5,=H'2'
           OFADBGREG 5
*
* CC = 2
           CH        5,=H'0'
           OFADBGREG 5
           BR        14
DATA       DC        H'1'
           END
