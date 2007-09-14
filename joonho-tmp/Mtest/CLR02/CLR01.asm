****************************************************************
* FILENAME: CLR01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
CLR01      CSECT
           LR        12,15
           USING     CLR01,12
* CC = 0           
           L         5,=X'02'
           L         6,=X'02'
           CLR       5,6
           OFADBGREG 5
* CC = 1
           L         6,=X'FF'
           CLR       5,6
           OFADBGREG 5
* CC = 2           
           L         6,=X'01'
           CLR       5,6
           OFADBGREG 5
           BR        14
           END
