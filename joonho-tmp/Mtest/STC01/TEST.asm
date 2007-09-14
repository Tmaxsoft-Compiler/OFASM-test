****************************************************************
*        FILENAME: TEST.asm (STORE CHARACTER)                  *
*        AUTHOR  : Yejin Jo                                    *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Condition Code: The code remains unchanged.           *
*        D2(X2,B2) - Displacement, index, base register        *
*        DATA Lable is Full word(4byte) and its value is 0.    *
*        STC : STORE ONLY 1 BYTE                               *
****************************************************************
TEST       CSECT
           LR        12,15
           USING     TEST,12
* --------------------------------------
* TEST 1 : 
* --------------------------------------
           L         3,=X'0000FF11'
           OFADBGREG 3
           L         5,DATA
           OFADBGREG 5
           STC       3,DATA
           OFADBGREG 3
           L         5,DATA
           OFADBGREG 5
* --------------------------------------
* END TEST
* --------------------------------------
           BR        14
DATA       DC        F'2'
           END

* NOT SURE THAT THIS PROCESS IS RIGHT - MINSEONG LEE
