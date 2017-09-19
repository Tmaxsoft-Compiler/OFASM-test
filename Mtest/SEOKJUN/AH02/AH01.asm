****************************************************************
* FILENAME: AH01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
AH01       CSECT
           LR        12,15
           USING     AH01,12
*
* TEST1: 25+-2 = 23, CC = 2
*
           LA        5,25
           AH        5,=H'-2'
           OFADBGREG 5
*
* TEST2: 25+-25 = 0, CC = 0
*
           LA        5,25(0,0)
           AH        5,=H'-25'
           OFADBGREG 5
*
* TEST3: 10+-25 = -15, CC = 1
*
           LA        5,10
           AH        5,=H'-25'
           OFADBGREG 5
*
* CC = 3
           L         5,=X'7FFFFFFF'
           AH        5,=H'25'
           OFADBGREG 5
           BR        14
           END
