****************************************************************
* FILENAME: OI01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
OI01       CSECT
           LR        12,15
           USING     OI01,12
           LA        5,=XL4'AA000000'
           OI        0(5),X'11'
           L         6,0(5)
           OFADBGREG 6
           LA        5,=XL4'00000000'
           OI        0(5),X'00'
           L         6,0(5)
           OFADBGREG 6
           BR        14
           END
