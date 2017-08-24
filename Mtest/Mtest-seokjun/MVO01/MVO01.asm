****************************************************************
* FILENAME: MVO01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
MVO01      CSECT
           LR        12,15
           USING     MVO01,12
           LA        5,DATA
           LA        6,DATA2
           OFADBGMEM 0(4,5),0
           
           MVO       0(4,5),0(3,6)
           OFADBGMEM 0(4,5),0
           BR        14
DATA       DC        XL4'7788990C'
DATA2      DC        XL3'123456'
           END
