****************************************************************
*        FILENAME: XI01.asm                                    *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code:                             *
*        0 Result zero                                         *
*        1 Result not  zero                                    *
****************************************************************
XI01        CSECT
            LR          12,15
            USING       XI01,12
            LA          2,DATA1
            L           3,DATA1
            OFADBGREG   2
            OFADBGREG   3
            XI          0(2),10
            OFADBGREG   2
            L           4,DATA1
            OFADBGREG   4
            BR          14
DATA1       DC          XL4'05555555'
            END
