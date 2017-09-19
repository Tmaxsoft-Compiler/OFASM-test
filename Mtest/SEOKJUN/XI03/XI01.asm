****************************************************************
* FILENAME: XI01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
XI01       CSECT
           LR        12,15
           USING     XI01,12
           LA        5,DATA
           XI        0(5),255
           L         6,0(5)
           OFADBGREG 6
           XI        0(5),170
           L         6,0(5)
           OFADBGREG 6
           BR        14
DATA       DC        XL4'55555555'
           END
