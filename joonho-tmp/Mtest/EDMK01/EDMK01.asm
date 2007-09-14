****************************************************************
* FILENAME: EDMK01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
EDMK01     CSECT
           LR        12,15
           USING     EDMK01,12
           LA        5,DATA
           LA        6,PATTERN
           LA        1,6(0,6)
           OFADBGMEM PATTERN,0
           EDMK      0(13,6),0(5)
           BCTR      1,0
           MVI       0(1),C'$'
           OFADBGMEM PATTERN,0
           BR        14
DATA       DC        PL4'257426'
PATTERN    DC        X'4020206B2021204B202040C3D9'
           END
