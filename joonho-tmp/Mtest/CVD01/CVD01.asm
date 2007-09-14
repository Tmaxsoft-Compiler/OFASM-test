****************************************************************
*        FILENAME: CVD01.asm                                   *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Second operand must be 8 bytes in length              *
****************************************************************
CVD01       CSECT
            LR          12,15
            USING       CVD01,12
            L           2,=XL4'00000F0F'
            LA          3,DATA1
            CVD         2,0(8,3)
            OFADBGMEM   DATA1,0
            BR          14
DATA1       DS          PL8
            END
            
