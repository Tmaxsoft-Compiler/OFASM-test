****************************************************************
* FILENAME: MP01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
MP01       CSECT
           LR        12,15
           USING     MP01,12
           LA        5,DATA
           LA        6,DATA2
           MP        0(3,5),0(2,6)
           ZAP       100(5,5),0(3,5)
           MP        100(5,5),0(2,6)
           OFADBGMEM 100(5,5),0

           

           BR        14
DATA       DC        P'1237'
DATA2      DC        P'234'
           END
