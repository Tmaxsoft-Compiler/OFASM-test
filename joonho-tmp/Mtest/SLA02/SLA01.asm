****************************************************************
* FILENAME: SLA01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
SLA01      CSECT
           LR        12,15
           USING     SLA01,12
           L         5,DATA
           OFADBGREG 5
           SLA       5,8(0)
           OFADBGREG 5

           BR        14
DATA       DC        XL4'7F0A72'
           END
