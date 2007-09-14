****************************************************************
* FILENAME: CLM01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
CLM01      CSECT
           LR        12,15
           USING     CLM01,12

           L         5,=X'00AC2B40'

* CC = 0
           CLM       5,B'0000',DATA
           OFADBGREG 5
* CC = 1
           CLM       5,B'1010',DATA
           OFADBGREG 5
* CC = 2
           CLM       5,B'0111',DATA
           OFADBGREG 5

           BR        14
DATA       DC        X'9F013C2F'
           END
