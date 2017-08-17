****************************************************************
*        FILENAME: TEST.asm                          *
*        AUTHOR  : MINSEONG LEE                      *
*        SYSTEM  : OFASM v3.0                        *
*        REMARKS                                     *
*           CC   Mask                                *
*                Position                            *
*                Value                               *
*           0    8                                   *
*           1    4                                   *
*           2    2                                   *
*           3    1                                   *
******************************************************
TEST        CSECT
            LR          12,15
            USING       TEST,12
            L           2,=XL4'00001000'
            L           3,=XL4'00005000'
            LA          4,INBR
            OFADBGREG   2
            OFADBGREG   3
            CR          2,3
            OFADBGREG   2
            BCR         4,4               * R2 < R3
            L           5,=XL4'00000001'
            OFADBGREG   5
            B           MODULEEND
INBR        L           5,=XL4'00000010'
            OFADBGREG   5
MODULEEND   BR          14
            END

