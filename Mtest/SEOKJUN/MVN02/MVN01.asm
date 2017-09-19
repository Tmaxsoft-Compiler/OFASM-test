****************************************************************
* FILENAME: MVN01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
MVN01      CSECT
           LR        12,15
           USING     MVN01,12
           LA        5,DATA
           LA        6,DATA2
           OFADBGMEM 0(4,5),0
           MVN       0(2,5),0(6)
           OFADBGMEM 0(4,5),0
           BR        14
DATA       DC        XL4'F0F1F2F3'
DATA2      DC        XL4'C6C7C8C9'
           END
