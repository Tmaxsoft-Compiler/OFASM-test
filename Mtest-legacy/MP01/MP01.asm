****************************************************************
*        FILENAME: MP01.asm                                    *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Multiply Decimal                                      *
****************************************************************
MP01        CSECT
            LR          12,15
            USING       MP01,12
            LA          2,=PL5'-38460'
            LA          3,=PL3'-321'
            OFADBGMEM   0(5,2),0
            OFADBGMEM   0(3,3),0
            MP          0(5,2),0(3,3)
            OFADBGMEM   0(5,2),0
            BR          14
            END
