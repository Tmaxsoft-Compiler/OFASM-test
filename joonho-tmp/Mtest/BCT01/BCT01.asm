******************************************************
*           FILENAME : BCT01.asm                     *
*           AUTHOR   : MINSEONG LEE                  *
*           SYSTEM   : OFASM v3.0                    *
******************************************************
BCT01       CSECT
            LR          12,15
            USING       BCT01,12
            L           2,=F'3'       * LOOP 3 TIMES
            L           3,=F'0'
            OFADBGREG   2
            OFADBGREG   3
* ----------------------------------------------------
* LOOP START
* ----------------------------------------------------
LUPE        A           3,=F'1'       * ADD 1 to REG3
            OFADBGREG   2
            OFADBGREG   3
            BCT         2,LUPE
* ----------------------------------------------------
* LOOP END
* ----------------------------------------------------
            OFADBGREG   2
            OFADBGREG   3
            BR          14
            END
