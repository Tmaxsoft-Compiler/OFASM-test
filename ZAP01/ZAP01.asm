****************************************************************
*        FILENAME: ZAP01.asm                                   *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code:                             *
*        0 Result zero             : no overflow               *
*        1 Result less than zero   : no overflow               *
*        2 Result greater than zero: no overflow               *
*        3 Overflow                                            *
****************************************************************
ZAP01       CSECT
            LR          12,15
            USING       ZAP01,12
            LA          2,DATA1
            LA          3,DATA2
            ZAP         0(5,2),0(3,3)
            L           5,DATA1+1
            OFADBGREG   4
            OFADBGREG   5
            BR          14
DATA1       DC          PL5'1234567890'
DATA2       DC          PL3'-38460'
            END
