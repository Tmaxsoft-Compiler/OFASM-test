****************************************************************
* FILENAME: STM01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
STM01      CSECT
           LR        12,15
           USING     STM01,12
           LH        5,=X'AAF'
           LH        6,=X'02AA'
           LH        7,=X'22'
           LH        8,=X'111'
           STM       5,8,OUTPUT
           OFADBGREG 5
           OFADBGREG 6
           OFADBGREG 7
           OFADBGREG 8

           OFADBGMEM OUTPUT,0
           BR        14
OUTPUT     DS        XL16
           END
