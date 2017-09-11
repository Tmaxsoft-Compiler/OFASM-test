*************************************************
* FILENAME : BAKR02.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 113
*************************************************
BAKR02     CSECT
           LR          12,15
           USING       BAKR02,12

           LA          5,PRNT_TRUE
*           OFADBGREG   5
           LA          6,PRNT_FALSE
*           OFADBGREG   6
           BAKR        5,6

PRNT_TRUE  OFADBGMEM   TRUE,1
PRNT_FALSE OFADBGMEM   FALSE,1
*           OFADBGREG   5
*           OFADBGREG   6
           BR          14
           END
TRUE       DC          C'TRUE'
FALSE      DC          C'FALSE'
