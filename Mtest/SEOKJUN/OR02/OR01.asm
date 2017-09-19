****************************************************************
* FILENAME: OR01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
OR01       CSECT
           LR        12,15
           USING     OR01,12
           L         5,=XL4'ABCDEF12'
           L         6,=XL4'21AB34DF'
           OR        5,6
           OFADBGREG 5
           L         5,=XL4'00000000'
           L         6,=XL4'00000000'
           OR        5,6
           OFADBGREG 5
           BR        14
           END
