****************************************************************
*        FILENAME: SRA01.asm                                   *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code                              *
*        0 Result zero                                         *
*        1 Result less than zero                               *
*        2 Result greater than zero                            *
*        3 --                                                  *
****************************************************************
SRA01       CSECT
            LR          12,15
            USING       SRA01,12
* --------------------------------------
* TEST 1: Result zero
* --------------------------------------
            L           2,=XL4'00000000'
            L           3,=F'4'
            OFADBGREG   2
            SRA         2,0(3)
            OFADBGREG   2
* --------------------------------------
* TEST 2: Result less than zero
* --------------------------------------
            L           2,=F'-2'
            L           3,=F'4'
            OFADBGREG   2
            SRA         2,0(3)
            OFADBGREG   2
* --------------------------------------
* TEST 3: Result greater than zero
* --------------------------------------
            L           2,=XL4'007F0A72'
            OFADBGREG   2
            SRA         2,8(0)
            OFADBGREG   2
* --------------------------------------
* END 
* --------------------------------------
            BR          14
            END
