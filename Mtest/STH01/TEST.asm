****************************************************************
*        FILENAME: TEST.asm (STORE HALFWORD)                   *
*        AUTHOR  : Yejin Jo                                    *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Condition Code: The code remains unchanged.           *
*        DATA  DC  F'83' - Data Declaration                    *
*        DATA Lable is Full word(4byte) and its value is 83.   *
*        STH - Store Halword - 2 byte                          *
****************************************************************
TEST       CSECT
           LR        12,15
           USING     TEST,12
           L         3,=F'21'
           L         5,DATA
           OFADBGREG 5
           STH       3,DATA
           LH        5,DATA
           OFADBGREG 5
* --------------------------------------
* END TEST
* --------------------------------------
           BR        14
DATA       DC        F'83'
           END
