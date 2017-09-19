*************************************************
* FILENAME : BALR01.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 113
*************************************************
BALR01          CSECT
                LR          12,15
                USING       BALR01,12

                L           5,=X'BBBBBBBB'
*                OFADBGREG   5
                LA          6,PRNT_FALSE
*                OFADBGREG   6

                BALR        5,6

PRNT_TRUE       OFADBGMEM   =C'TRUE',1
PRNT_FALSE      OFADBGMEM   =C'FALSE',1
*                OFADBGREG   5
*                OFADBGREG   6
                BR          14
                END
