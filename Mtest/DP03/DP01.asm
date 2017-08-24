****************************************************************
* FILENAME: DP01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
DP01       CSECT
           LR        12,15
           USING     DP01,12
           LA        5,DATA
           LA        6,DATA2
           OFADBGMEM DATA,0
           DP        0(4,5),0(2,6)
           OFADBGMEM DATA,0
           BR        14
DATA       DC        PL4'123456'
DATA2      DC        PL2'321'
           END
