****************************************************************
* FILENAME: CLI01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
CLI01      CSECT
           LR        12,15
           USING     CLI01,12
* CC = 0
           CLI       DATA,X'01'
           OFADBGREG 5
* CC = 1
           CLI       DATA,X'03'
           OFADBGREG 5
* CC = 2
           CLI       DATA1,X'00'
           OFADBGREG 5
           BR        14
           END
DATA       DC        X'01'
DATA1      DC        X'FF'
