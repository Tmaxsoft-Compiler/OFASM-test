****************************************************************
*        FILENAME: SRL01.asm                                   *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code:                             *
*        The code remains unchanged                            *
****************************************************************
SRL01       CSECT
            LR          12,15
            USING       SRL01,12
* TEST 1
            L           2,=XL4'00000000'
            L           3,=F'4'
            OFADBGREG   2
            SRL         2,0(3)
            OFADBGREG   2
* TEST 2
            L           2,=F'-2'
            L           3,=F'4'
            OFADBGREG   2
            SRL         2,0(3)
            OFADBGREG   2
* TEST 3
            L           2,=XL4'007F0A72'
            OFADBGREG   2
            SRL         2,8(0)
            OFADBGREG   2
            BR          14
            END
