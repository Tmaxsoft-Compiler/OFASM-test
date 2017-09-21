****************************************************************
* FILENAME: ED01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
ED01       CSECT
           LR        12,15
           USING     ED01,12
           LA        5,DATA
           LA        6,PATTERN
           OFADBGMEM PATTERN,0
           ED        0(13,6),0(5)
           OFADBGMEM PATTERN,0
           BR        14
DATA       DC        PL4'257426'
PATTERN    DC        X'4020206B2021204B202040C3D9'
           END
