*********************************************************
* FILENAME: TEST.asm (Multiply Register)                *
* AUTHOR  : Yejin Jo                                    *
* SYSTEM  : OFASM v3.0                                  *
* REMARKS                                               *
* Condition Code: The code remains unchanged.           *
* 1st,2nd operand: 32bit signed                         *
* result: 64bit signed, saved at 1st operand location   *
* R1: even reg., R2: odd regi. ex R1:2, R2:3            *
* Bits 0-31 of the result -> 32-63 of general reg. R1.  *
* Bits 32-63 of the result-> 32-63 of general reg. R2.  *
* 2sangham
*********************************************************
TEST       CSECT
           LR        12,15
           USING     TEST,12
* --------------------------------------
* TEST 1 : Result : 3*4==12
* --------------------------------------
           LG        3,=X'0000000000000003'
           OFADBGREG 3
           LG        4,=X'0000000000000004'
           OFADBGREG 4
           MR        2,4
           OFADBGREG 2
           OFADBGREG 3
* --------------------------------------
* TEST 2 : Result : 0X9A*0X83==0X4ECE
* --------------------------------------
           LH        3,=X'009A'
           OFADBGREG 3
           LH        4,=X'0083'
           OFADBGREG 4
           MR        2,4
           OFADBGREG 2
           OFADBGREG 3
* --------------------------------------
* TEST 3 : Result : 0X93EF7C*0X5813A3==0X32E5AB97AFF4
* --------------------------------------
           L         3,=X'0093EF7C'
           OFADBGREG 3
           L         4,=X'005813A3'
           OFADBGREG 4
           MR        2,4
           OFADBGREG 2
           OFADBGREG 3
* --------------------------------------
* TEST 4 : Result : 0X7FFFFFFF*0X7FFFFFFF==0X3FFFFFFF00000001
* --------------------------------------
           L         3,=X'7FFFFFFF'
           OFADBGREG 3
           L         4,=X'7FFFFFFF'
           OFADBGREG 4
           MR        2,4
           OFADBGREG 2
           OFADBGREG 3
* --------------------------------------
* TEST 5 : Result : pos*neg => 0x287C3B27*0xB25EC74A
* == 0x287C3B27*0x4DA138B6 == 0xF3B9231C1C366A46
* --------------------------------------
           L         3,=X'287C3B27'
           OFADBGREG 3
           L         4,=X'B25EC74A'
           OFADBGREG 4
           MR        2,4
           OFADBGREG 2
           OFADBGREG 3
* --------------------------------------
* TEST 5 : Result : neg*neg => 0xD783C4D9*0xB25EC74A
* == 0X287C3B27*0x4DA138B6 == 0x0C46DCE3E3C995BA
* --------------------------------------
           L         3,=X'D783C4D9'
           OFADBGREG 3
           L         4,=X'B25EC74A'
           OFADBGREG 4
           MR        2,4
           OFADBGREG 2
           OFADBGREG 3
* --------------------------------------
* END TEST
* --------------------------------------
           BR        14
           END
