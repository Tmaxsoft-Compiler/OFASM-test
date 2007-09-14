****************************************************************
* FILENAME: ZAP01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
ZAP01      CSECT
           LR        12,15
           USING     ZAP01,12
           LA        5,DATA
           LA        6,DATA2
           OFADBGMEM DATA,0
           ZAP       0(4,5),0(2,6)
           OFADBGMEM DATA,0

           BR        14
DATA       DC        PL4'1234115'
DATA2      DC        PL2'335'
           END
