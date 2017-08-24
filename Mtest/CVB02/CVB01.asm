****************************************************************
* FILENAME: CVB01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
CVB01      CSECT
           LR        12,15
           USING     CVB01,12
           LA        5,DATA
           CVB       6,0(5)
           OFADBGREG 6

           BR        14
DATA       DC        PL8'25594'
           END
