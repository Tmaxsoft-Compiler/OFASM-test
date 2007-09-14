****************************************************************
*        FILENAME: BRC01.asm                                   *
*        AUTHOR  : Minseong Lee                                *
*        SYSTEM  : OFASM v3.0                                  *
****************************************************************
BRC01       CSECT
            LR          12,15
            USING       BRC01,12
            L           2,=F'4'
            L           3,=F'5'
            CR          2,3
            BRC         15,20
            L           4,=F'1'         *  4
            OFADBGREG   4               *  8 
            L           4,=F'2'         * 10 
            OFADBGREG   4               * 14 
            L           4,=F'3'         * 16
            OFADBGREG   4               * 20
            L           4,=F'4'         * 22
            OFADBGREG   4               * 26
            L           4,=F'5'         * 28
            OFADBGREG   4               * 32 
            BR          14              * 34
            END
