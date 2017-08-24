****************************************************************
* FILENAME: MVZ01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
MVZ01      CSECT
           LR        12,15
           USING     MVZ01,12
           LA        5,DATA
           LA        6,DATA2
           OFADBGMEM 0(4,5),0
           MVZ       0(4,5),0(6)
           OFADBGMEM 0(4,5),0
           BR        14
DATA       DC        XL4'F1C2F3C4'
DATA2      DC        XL4'D5F6D7F8'
           END
