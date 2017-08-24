****************************************************************
* FILENAME: MVI01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
MVI01      CSECT
           LR        12,15
           USING     MVI01,12
           LA        5,DATA
           OFADBGMEM 0(4,5),0
           MVI       0(5),X'34'
           OFADBGMEM 0(4,5),0
           BR        14
DATA       DC        XL2'ABCD'
           END
