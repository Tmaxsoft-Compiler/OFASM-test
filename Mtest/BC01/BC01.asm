******************************************************
*           FILENAME : BC01.asm                      *
*           AUTHOR   : MINSEONG LEE                  *
*           SYSTEM   : OFASM v3.0                    *
*           REMARKS                                  *
*           CC   Mask                                *
*                Position                            *
*                Value                               *
*           0    8                                   *
*           1    4                                   *
*           2    2                                   *
*           3    1                                   *
******************************************************
BC01        CSECT
            LR          12,15
            USING       BC01,12
            L           2,=XL4'00001000'
            L           3,=XL4'00005000'
            OFADBGREG   2
            OFADBGREG   3
            CR          2,3
            OFADBGREG   2
            BC          4,INBR               * R2 < R3
            L           4,=XL4'00000001'
            OFADBGREG   4
            B           MODULEEND
INBR        L           4,=XL4'00000010'
            OFADBGREG   4
MODULEEND   BR          14      
            END

