****************************************************************
*        FILENAME: MH01.asm                                    *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Second operand must be 2 bytes in length              *
****************************************************************
MH01        CSECT
            LR          12,15
            USING       MH01,12
            L           2,=XL4'00000015'  *  21 in decimal
            LA          3,=XL2'FFD9'      * -39 in decimal
            MH          2,0(3)
            OFADBGREG   2 
            BR          14
            END
