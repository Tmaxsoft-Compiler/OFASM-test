****************************************************************
*        FILENAME: TEST.asm                                    *
*        AUTHOR  : Yejin Jo                                    *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
****************************************************************
TEST       CSECT
           LR        12,15
           USING     TEST,12
* --------------------------------------
* TEST 1 : normal test
* --------------------------------------
           MVN       TAR1,SRC1
           LG        3,TAR1
           OFADBGREG 3
* --------------------------------------
* END TEST
* --------------------------------------
           BR        14
SRC1       DC        X'0102030405060708'
TAR1       DS        CL8
           END

* length test need
* over 256 
* not over 256 test
