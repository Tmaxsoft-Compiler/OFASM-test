****************************************************************
*        FILENAME: O01.asm                                     *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code:                             *
*        0 Result zero                                         *
*        1 Result not zero                                     *
****************************************************************
O01     CSECT       
        LR          12,15
        USING       O01,12
*   TEST1: NOT ZERO
        L           2,=F'15'
        OFADBGREG 2
        O           2,=F'255'
        OFADBGREG 2
*   TEST2: ZERO
        L           3,=F'0'
        OFADBGREG   3
        O           3,=F'0'
        OFADBGREG   3
        BR          14
        END
