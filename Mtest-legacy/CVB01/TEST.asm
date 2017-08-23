****************************************************************
*        FILENAME: TEST.asm                                    *
*        AUTHOR  : Yejin Jo                                    *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        CVB: CONVERT TO BINARY (32) - RX-a                    *
*        Resulting Condition Code:                             *
*        The code remains unchanged.                           *
****************************************************************
TEST       CSECT
           LR        12,15
           USING     TEST,12
* --------------------------------------
* TEST 1 :  
* --------------------------------------
           OFADBGMEM DATA11,0
           CVB       3,DATA11
           OFADBGREG 3

           OFADBGMEM DATA22,0
           CVB       2,DATA22
           OFADBGREG 2

           OFADBGMEM DATA44,0
           CVB       4,DATA44
           OFADBGREG 4

           OFADBGMEM DATA55,0
           CVB       5,DATA55
           OFADBGREG 5

           OFADBGMEM DATA66,0
           CVB       6,DATA66
           OFADBGREG 6

           OFADBGMEM DATA77,0
           CVB       7,DATA77
           OFADBGREG 7
* -------------------------------------
* END TEST
* -------------------------------------
           BR        14
DATA11     DC        PL8'25594'
DATA22     DC        PL3'25594'
DATA44     DC        PL4'25594'
DATA55     DC        PL5'25594'
DATA66     DC        PL6'25594'
DATA77     DC        PL7'25594'
           END
