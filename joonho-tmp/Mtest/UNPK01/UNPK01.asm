****************************************************************
*        FILENAME: UNPK01.asm                                  *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
*        REMARKS                                               *
*        Resulting Condition Code:                             *
*        The code remains unchanged                            *
****************************************************************
UNPK01      CSECT
            LR          12,15
            USING       UNPK01,12
            LA          2,UDATA
            LA          3,DATA
            UNPK        0(5,2),0(2,3)
            LG          4,UDATA
            OFADBGREG   4
            BR          14
UDATA       DS          ZL8
DATA        DC          PL2'-123'
            END
