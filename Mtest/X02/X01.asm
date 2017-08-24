****************************************************************
* FILENAME: X01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
X01        CSECT
           LR        12,15
           USING     X01,12
           L         5,=XL4'123'
           X         5,=XL4'234'
           OFADBGREG 5
           L         5,=XL4'0'
           X         5,=XL4'0'
           OFADBGREG 5
           BR        14
           END
