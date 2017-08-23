****************************************************************
*        FILENAME: TEST.asm (O : OR)                           *
*        AUTHOR  : Yejin Jo                                    *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code:                             *
*        0 Result zero                                         *
*        1 Result not zero                                     *
*        2 --                                                  *
*        3 --                                                  *
****************************************************************
TEST       CSECT
           LR        12,15
           USING     TEST,12
* --------------------------------------
* TEST 1 : Result : 1 || 1 == 1
* --------------------------------------
           L         3,=F'1'
           OFADBGREG 3
           L         4,=F'1'
           OFADBGREG 4
           XR        3,4
           OFADBGREG 3
* --------------------------------------
* TEST 2 : Result : 0 || 1 == 1
* --------------------------------------
           L         3,=F'0'
           OFADBGREG 3
           L         4,=F'1'
           OFADBGREG 4
           XR        3,4
           OFADBGREG 3
* --------------------------------------
* TEST 3 : Result : 1 || 0 == 1
* --------------------------------------
           L         3,=F'1'
           OFADBGREG 3
           L         4,=F'0'
           OFADBGREG 4
           XR        3,4
           OFADBGREG 3
* --------------------------------------
* TEST 4 : Result : 0 || 0 == 0
* --------------------------------------
           L         3,=F'0'
           OFADBGREG 3
           L         4,=F'0'
           OFADBGREG 4
           XR        3,4
           OFADBGREG 3
* --------------------------------------
* END TEST
* --------------------------------------
           BR        14
           END
