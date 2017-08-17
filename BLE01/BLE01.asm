****************************************************************
*        FILENAME: BLE01.asm                                   *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Branch if Op1 Low or Equal                            *
*        (Mask field is 12)                                    *
****************************************************************
BLE01       CSECT
            LR          12,15
            USING       BLE01,12
*-------------------------------
*TEST1:EQUAL: PRINT  0
*-------------------------------
            L           2,DATA1
            L           3,DATA1
            CR          2,3
            BLE         BRAN1
            L           4,DATA3
            B           MEND1
BRAN1       L           4,DATA0
MEND1       OFADBGREG   4
*-------------------------------
*TEST2:LOW  : PRINT  1
*-------------------------------
            L           3,DATA2
            CR          2,3
            BLE         BRAN2
            L           4,DATA3
            B           MEND2
BRAN2       L           4,DATA1
MEND2       OFADBGREG   4
*-------------------------------
*TEST3:HIGH : PRINT -1
*-------------------------------
            CR          3,2
            BLE         BRAN3
            L           4,DATA3
            B           MEND3
BRAN3       L           4,DATA2
MEND3       OFADBGREG   4
            BR          14
*-------------------------------
*DATA
*-------------------------------
DATA0       DC          F'0'
DATA1       DC          F'1'
DATA2       DC          F'2'
DATA3       DC          F'-1'
            END
