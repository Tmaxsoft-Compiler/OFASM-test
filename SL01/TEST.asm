****************************************************************
*        FILENAME: TEST.asm                                    *
*        AUTHOR  : Yejin Jo                                    *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code:                             *
*        0 ---                                                 *
*        1 Result not zero:    borrow /    carry               *     
*        2 Result zero:     no borrow / no carry               *
*        3 Result not zero: no borrow / no carry               *
****************************************************************
TEST       CSECT
           LR        12,15
           USING     TEST,12
* --------------------------------------
* TEST 1 : Result : 0-1 = -1 < 0 ; borrow / carry, CC = 1
* --------------------------------------
           L         3,=F'0'
           OFADBGREG 3
           SL        3,=F'1'
           OFADBGREG 3
* --------------------------------------
* TEST 2 : Result : 1-1 = 0 = 0; no borrow / no carry, CC = 2
* --------------------------------------
           L         3,=F'1'
           OFADBGREG 3
           SL        3,=F'1'
           OFADBGREG 3
* --------------------------------------
* TEST 3 : Result : 1-0 = 1 > 0; no borrow / no carry, CC = 3
* --------------------------------------
           L         3,=X'00000001'
           OFADBGREG 3
           SL        3,=X'00000000'
           OFADBGREG 3
* --------------------------------------
* END TEST
* --------------------------------------
           BR        14
           END
