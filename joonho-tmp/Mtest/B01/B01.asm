****************************************************************
* FILENAME: B01.asm
* AUTHOR: JOONHO JUNG
* SYSTEM: OFASM v4.0 revision 133
****************************************************************
B01     CSECT
        LR    12,15
        USING B01,12
        B     *+4
        MVI   0(2),X'40'
        B     MAIN 
        MVI   0(2),X'30'
        OFADBGREG 2
*
MAIN    MVI   0(2),X'20'
        B     SUB
*
SUB     OFADBGMEM 0(1,2),0
        BR 14
        END
