****************************************************************
*        FILENAME: SLA01.asm                                   *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code:                             *
*        0 Result zero:              no overflow               *
*        1 Result less than zero:    no overflow               *
*        2 Result greater than zero: no overflow               *
*        3 Overflow                                            *
****************************************************************
SLA01       CSECT
            LR          12,15
            USING       SLA01,12
*---------------------------------------------------------------
*TEST1: Result zero 
*---------------------------------------------------------------
            L           2,=XL4'00000000'
            OFADBGREG   2
            SLA         2,8(0)
            OFADBGREG   2
*---------------------------------------------------------------
*TEST2: Result less than zero
*---------------------------------------------------------------
            L           2,=XL4'C0FD1452'
            OFADBGREG   2
            SLA         2,1(0)
            OFADBGREG   2
*---------------------------------------------------------------
*TEST3: Result greater than zero
*---------------------------------------------------------------
            L           2,=XL4'007F0A72'
            L           3,=F'8'
            OFADBGREG   2
            SLA         2,0(3)
            OFADBGREG   2
*---------------------------------------------------------------
*TEST4: Overflow
*---------------------------------------------------------------
            L           2,=XL4'FF700FFF'
            L           3,=F'8'
            OFADBGREG   2
            SLA         2,0(3)
            OFADBGREG   2
            BR          14
            END
