****************************************************************
*        FILENAME: N01.asm                                     *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code:                             *
*        0 Result zero                                         *
*        1 Result not  zero                                    *
****************************************************************
N01     CSECT
        LR              12,15
        USING           N01,12
* TEST 1:
        L               4,=BL4'11010010'
        LA              2,DATA1
        OFADBGREG       4
        N               4,0(2)
        OFADBGREG       4
* TEST 2:
        L               4,=BL4'11010011'
        OFADBGREG       4
        N               4,DATA2
        OFADBGREG       4
* END
        BR              14
DATA1   DC              BL4'00101101'
DATA2   DC              BL4'11111111'
        END
