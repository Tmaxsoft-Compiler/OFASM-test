****************************************************************
*        FILENAME: NR01.asm                                    *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code                              *
*        0 Result zero                                         *
*        1 Result not zero                                     *
****************************************************************
NR01        CSECT
            LR          12,15
            USING       NR01,12
* -----------------------------------------
* TEST 1 : Result zero
* -----------------------------------------
            L           2,=BL4'11111111'
            L           3,=BL4'10010100'
            OFADBGREG   2
            OFADBGREG   3
            NR          2,3
            OFADBGREG   2
* -----------------------------------------
* TEST 2 : Result not zero
* -----------------------------------------
            L           2,=BL4'10010001'
            L           3,=BL4'00000000'
            OFADBGREG   2
            OFADBGREG   3
            NR          2,3
            OFADBGREG   2
* -----------------------------------------
* END
* -----------------------------------------
            BR          14
            END
