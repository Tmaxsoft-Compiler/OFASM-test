****************************************************************
* FILENAME: SRP01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
SRP01      CSECT
           LR        12,15
           USING     SRP01,12
           OFADBGMEM DATA,0
           SRP       DATA(4),3,0
           OFADBGMEM DATA,0
           OFADBGMEM DATA2,0
           SRP       DATA2(3),64-2,0
           OFADBGMEM DATA2,0
           BR        14
DATA       DC        PL4'1234'
DATA2      DC        PL4'-2344'
           END
