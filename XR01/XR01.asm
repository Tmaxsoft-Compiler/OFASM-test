****************************************************************
*        FILENAME: XR01.asm                                    *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code:                             *
*        0 Result zero                                         *
*        1 Result not zero   : no overflow                     *
****************************************************************
XR01        CSECT
            LR          12,15
            USING       XR01,12
            L           2,=XL4'00001790'
            L           3,=XL4'00001401'
            OFADBGREG   2
            OFADBGREG   3
            XR          2,3
            OFADBGREG   2
            OFADBGREG   3
            BR          14
            END
