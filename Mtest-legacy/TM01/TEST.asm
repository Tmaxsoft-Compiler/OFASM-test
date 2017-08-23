****************************************************************
*        FILENAME: TEST.asm                                    *
*        AUTHOR  : Yejin Jo                                    *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        TM(TEST UNDER MASK) - SI                              *
*        Resulting Condition Code:                             *
*        0 Selected bits all zeros, or mask bits all zeros     *
*        1 Selected bits mixed zeros and ones                  *
*        2 --                                                  *
*        3 Selected bits all ones                              *
****************************************************************
TEST       CSECT
           LR        12,15
           USING     TEST,12
* --------------------------------------
* TEST 1 :
* --------------------------------------
           TM        OP1_DATA1,B'00000000'
           OFADBGREG 3
* --------------------------------------
* TEST 1 :
* --------------------------------------
           TM        DATA2,B'00000000'
           OFADBGREG 3
* --------------------------------------
* TEST 1 :
* --------------------------------------
           TM        OP1_DATA1,B'11111111'
           OFADBGREG 3
* --------------------------------------
* TEST 1 :
* --------------------------------------
           TM        DATA3,B'11110000'
           OFADBGREG 3
* --------------------------------------
* END TEST
* --------------------------------------
           BR        14
OP1_DATA1  DC        B'11111111'
DATA2      DC        B'00000000'
DATA3      DC        B'10100000'
           END
