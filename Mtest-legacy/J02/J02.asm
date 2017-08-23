****************************************************************
*        FILENAME: J02.asm                                     *
*        AUTHOR  : Minseong Lee                                *
*        SYSTEM  : OFASM v3.0                                  *
*        Unconditional Branch                                  *
****************************************************************

J02         CSECT
            LR          12,15
            USING       J02,12
            L           2,=X'00000001'
            OFADBGREG   2
            A           2,=X'00000001'
            J           8                * Jump to JUMP1
            A           2,=X'00000004'
            OFADBGREG   2                * JUMP1
            L           3,=X'00000003'
            OFADBGREG   3
            A           3,=X'00000001'
            J           JUMP2            * Jump to JUMP2
            A           3,=X'00000001'
            A           3,=X'00000001'
            A           3,=X'00000001'
JUMP2       OFADBGREG   3
            BR          14
            END
