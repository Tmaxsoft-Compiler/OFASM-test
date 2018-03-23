****************************************************************
*        FILENAME: SLDA01.asm                                  *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code:                             *
*        0 Result zero:              no overflow               *
*        1 Result less than zero:    no overflow               *
*        2 Result greater than zero: no overflow               *
*        3 Overflow                                            *
****************************************************************
SLDA01      CSECT
            LR          12,15
            USING       SLDA01,12
*---------------------------------------------------------------
*TEST1: Result zero 
*---------------------------------------------------------------
            L           2,=XL4'00000000'
            L           3,=XL4'00000000'
            OFADBGREG   2
            OFADBGREG   3
            SLDA        2,4(0)
            OFADBGREG   2
            OFADBGREG   3
*---------------------------------------------------------------
*TEST2: Result less than zero
*---------------------------------------------------------------
            L           2,=XL4'FF00FFFF'
            L           3,=XL4'FFFF0000'
            OFADBGREG   2
            OFADBGREG   3
            SLDA        2,4(0)
            OFADBGREG   2
            OFADBGREG   3
*---------------------------------------------------------------
*TEST3: Result greater than zero
*---------------------------------------------------------------
            L           2,=XL4'007F0A72'
            L           3,=XL4'FFFF0000'
            OFADBGREG   2
            OFADBGREG   3
            SLDA        2,4(0)
            OFADBGREG   2
            OFADBGREG   3
*---------------------------------------------------------------
*TEST4: Overflow
*---------------------------------------------------------------
            L           2,=XL4'7FFFFFFF'
            L           3,=XL4'FFFF0000'
            OFADBGREG   2
            OFADBGREG   3
            SLDA        2,4(0)
            OFADBGREG   2
            OFADBGREG   3
            BR          14
            END
