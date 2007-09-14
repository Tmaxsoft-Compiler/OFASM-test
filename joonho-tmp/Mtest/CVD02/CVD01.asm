****************************************************************
* FILENAME: CVD01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
CVD01      CSECT
           LR        12,15
           USING     CVD01,12
           L         5,DATA
           LA        6,DATA2
           CVD       5,0(6)
           OFADBGMEM DATA2,0
           BR        14
DATA       DC        XL4'ABE123'
DATA2      DS        PL8
           END
