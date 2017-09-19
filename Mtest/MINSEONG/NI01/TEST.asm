****************************************************************
*        FILENAME: TEST.asm                                    *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code:                             *
*        0 Result zero                                         *
*        1 Result not zero                                     *
*        2 --                                                  *
*        3 --                                                  *
****************************************************************
TEST        CSECT
            LR          12,15
            USING       TEST,12
* ---------------------------------------
* TEST 1:   Result : 0 && 0 == 0
* Input is 0x00000000
* ---------------------------------------
            LA          2,DATA1
            L           3,DATA1
            OFADBGREG   3
            NI          0(2),0
            L           3,DATA1
            OFADBGREG   3
* ---------------------------------------
* TEST 2:   Result : 0 && 1 == 0
* Input is 0x00000000
* ---------------------------------------
            LA          2,DATA1
            L           3,DATA1
            OFADBGREG   3
            NI          0(2),1
            L           3,DATA1
            OFADBGREG   3
* ---------------------------------------
* TEST 3:   Result : 1 && 1 == 1
* Input is 0x01000000
* ---------------------------------------
            LA          2,DATA2
            L           3,DATA2
            OFADBGREG   3
            NI          0(2),1
            L           3,DATA2
            OFADBGREG   3
* ---------------------------------------
* TEST 4:   Result : 1 && 0 == 0
* Input is 0x01000000
* ---------------------------------------
            LA          2,DATA2
            L           3,DATA2
            OFADBGREG   3
            NI          0(2),0
            L           3,DATA1
            OFADBGREG   3
* ---------------------------------------
* END TEST
* ---------------------------------------
            BR          14
* ---------------------------------------
* DATA
* ---------------------------------------
DATA1       DC          XL4'00000000'
DATA2       DC          XL4'11000000'
            END

