****************************************************************
* FILENAME: CP01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
CP01       CSECT
           LR        12,15
           USING     CP01,12
           LA        5,DATA
           LA        6,DATA2
           CP        0(2,5),0(2,6)
           OFADBGREG 4
           LA        6,DATA
           CP        0(2,5),0(2,6)
           OFADBGREG 4
           LA        5,DATA2
           CP        0(2,5),0(2,6)
           OFADBGREG 4

           BR        14
DATA       DC        PL2'123'
DATA2      DC        PL2'332'
           END
