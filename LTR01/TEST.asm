****************************************************************
*        FILENAME: TEST.asm                                    *
*        AUTHOR  : MINSEONG LEE                                    *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        LTR(LOAD AND TEST) - RR                               *
*        Resulting Condition Code:                             *
*        0 Result zero                                         *
*        1 Result less than zero                               *
*        2 Result greater than zero                            *
*        3 --                                                  *
****************************************************************
TEST       CSECT
           LR        12,15
           USING     TEST,12
* --------------------------------------
* TEST 1 : Result zero
* --------------------------------------
           L         4,=X'00000000'
           LTR       3,4
           OFADBGREG 3
* --------------------------------------
* TEST 2 : Result less than zero
* --------------------------------------
           L         4,=X'FFFFFFFF'
           LTR       3,4
           OFADBGREG 3
* --------------------------------------
* TEST 3 : Result greater than zero
* --------------------------------------
           L         4,=X'11111111'
           LTR       3,4
           OFADBGREG 3
* --------------------------------------
* END TEST
* --------------------------------------
           BR        14
           END
