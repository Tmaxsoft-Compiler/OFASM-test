****************************************************************
* FILENAME: AP01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
AP01       CSECT
           LR        12,15
           USING     AP01,12
           LA        5,DATA
           LA        6,DATA2
           AP        0(2,5),0(2,6)
           OFADBGMEM 0(4,5),0
           LA        6,DATA3
           AP        0(2,5),0(2,6)
           OFADBGMEM 0(4,5),0
           BR        14
DATA       DC        PL2'123'
DATA2      DC        PL2'12'
DATA3      DC        PL2'-333'
           END
