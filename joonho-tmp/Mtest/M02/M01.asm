****************************************************************
* FILENAME: M01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
M01        CSECT
           LR        12,15
           USING     M01,12
           L         5,DATA
           LA        11,=XL4'FFFF999A'
           M         4,0(11)
           OFADBGREG 5
           L         5,DATA
           LA        11,=XL4'9A'
           M         4,0(11)
           OFADBGREG 5
           L         5,=XL4'FFFFF345'
           LA        11,=XL4'FFFFFFBA'
           M         4,0(11)
           OFADBGREG 5
           BR        14
DATA       DC        XL4'83'
           END
