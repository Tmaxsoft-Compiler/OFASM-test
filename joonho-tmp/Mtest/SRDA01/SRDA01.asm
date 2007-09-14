****************************************************************
*        FILENAME: SRDA01.asm                                  *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code                              *
*        0 Result zero                                         *
*        1 Result less than zero                               *
*        2 Result greater than zero                            *
*        3 --                                                  *
****************************************************************
SRDA01      CSECT
            LR          12,15
            USING       SRDA01,12
* --------------------------------------
* TEST 1: Result zero
* --------------------------------------
            L           2,=XL4'00000000'
            L           3,=XL4'00000000'
            OFADBGREG   2
            OFADBGREG   3
            SRDA        2,4(0)
            OFADBGREG   2
            OFADBGREG   3
* --------------------------------------
* TEST 2: Result less than zero
* --------------------------------------
            L           2,=XL4'8000FFFF'
            L           3,=XL4'FFFF0000'
            OFADBGREG   2
            OFADBGREG   3
            SRDA        2,4(0)
            OFADBGREG   2
            OFADBGREG   3
* --------------------------------------
* TEST 3: Result greater than zero
* --------------------------------------
            L           2,=XL4'007F0A72'
            L           3,=XL4'FFFF0000'
            OFADBGREG   2
            OFADBGREG   3
            SRDA        2,8(0)
            OFADBGREG   2
            OFADBGREG   3
* --------------------------------------
* END 
* --------------------------------------
            BR          14
            END
