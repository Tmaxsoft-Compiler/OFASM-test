****************************************************************
*        FILENAME: DR01.asm                                    *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
****************************************************************
DR01        CSECT
            LR          12,15
            USING       DR01,12
* --------------------------------------
* TEST 5 : Result : neg*neg => 0x0C46DCE3E3C995BA / 0xD783C4D9
* == 0xB25EC74A ... 0
* test case from D01...
* --------------------------------------
            L           2,=X'0C46DCE3'
            OFADBGREG   2
            L           3,=X'E3C995BA'
            OFADBGREG   3
            L           4,=X'D783C4D9'
            OFADBGREG   4
            DR          2,4
            OFADBGREG   2
            OFADBGREG   3
            BR          14

