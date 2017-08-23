****************************************************************
*        FILENAME: BNM01.asm                                   *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Branch on Not Minus                                   *
*        (Mask field is 11)                                    *
****************************************************************
BNM01       CSECT
            LR          12,15
            USING       BNM01,12
*-------------------------------
*TEST1:Sum is zero: PRINT 0
*-------------------------------
            L           2,DATA0
            L           3,DATA1
            AR          2,3
            BNM         BRAN1
            L           4,=F'-1'
            B           MEND1
BRAN1       L           4,=F'0'
MEND1       OFADBGREG   4
*-------------------------------
*TEST2:Sum is minus: PRINT -1
*-------------------------------
            L           2,DATA0
            L           3,DATA2
            AR          2,3
            BNM         BRAN2
            L           4,=F'-1'
            B           MEND2
BRAN2       L           4,=F'1'
MEND2       OFADBGREG   4
*-------------------------------
*TEST3:Sum is plus: PRINT 1
*-------------------------------
            L           2,DATA1
            L           3,DATA2
            AR          2,3
            BNM         BRAN3
            L           4,=F'-1'
            B           MEND3
BRAN3       L           4,=F'2'
MEND3       OFADBGREG   4
            BR          14
*-------------------------------
*DATA
*-------------------------------
DATA0       DC          F'-1'
DATA1       DC          F'1'
DATA2       DC          F'0'
            END
