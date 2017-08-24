****************************************************************
* FILENAME: STCM01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
STCM01     CSECT
           LR        12,15
           USING     STCM01,12
           L         5,DATA
           OFADBGMEM DATA,0
           STCM      5,B'1100',RES
           OFADBGMEM RES,0
           BR        14
DATA       DC        CL4'ABCD'
RES        DS        CL4
           END
