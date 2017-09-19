****************************************************************
* FILENAME: OC01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
OC01       CSECT
           LR        12,15
           USING     OC01,12
           LA        5,DATA
           LA        6,DATA2
           OC        0(3,6),0(5)
           L         7,0(6)
           OFADBGREG 7
           LA        5,ZERO
           LA        6,ZERO
           OC        0(2,6),0(5)
           L         7,0(6)
           OFADBGREG 7
           BR        14
DATA       DC        XL4'55555555'
DATA2      DC        XL4'AAAAAAAA'
ZERO       DC        XL4'00000000'
           END
