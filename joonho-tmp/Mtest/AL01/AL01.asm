****************************************************************
*        FILENAME: AL01.asm                                    *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code:                             *
*        0 Result zero      : No carry                         *
*        1 Result not zero  : No carry                         *
*        2 Result zero      : Carry                            *
*        3 Result not zero  : Carry                            *
****************************************************************
AL01        CSECT
            LR              12,15              
            USING           AL01,12
* TEST1: ZERO/NO CARRY
            L               2,=F'0'
            AL              2,=F'0'
            OFADBGREG       2
* TEST2: NOT ZERO/NO CARRY
            L               2,=F'0'
            AL              2,=F'1'
            OFADBGREG       2
* TEST3: ZERO/CARRY
            L               2,=XL8'FFFFFFFF'
            AL              2,=XL8'00000001'
            OFADBGREG       2
* TEST4: NOT ZERO/CARRY
            L               2,=XL8'FFFFFFFF'
            AL              2,=XL8'00000002'
            OFADBGREG       2
            BR              14
            END
