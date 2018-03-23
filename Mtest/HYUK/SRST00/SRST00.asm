*************************************************
* FILENAME : SRST00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 258 
*************************************************
                MACRO
                MACRO_SRST  &CHAR,&STRING,&STR_LEN
                LG          0,REG_INIT
                LG          2,REG_INIT
                LG          3,REG_INIT
                L           0,&CHAR
                LA          4,&STRING+&STR_LEN
                LA          5,&STRING
                LR          2,4
                LR          3,5
                SRST        2,3
                OFADBGMEM   &STRING,1
                OFADBGREG   0
                LR          6,2
                LR          7,3
                L           2,REG_INIT+4
                L           3,REG_INIT+4
                OFADBGREG   2
                OFADBGREG   3
                SR          6,4
                OFADBGREG   6
                SR          7,5
                OFADBGREG   7
                MEND
SRST00          CSECT
                LR          12,15
                USING       SRST00,12
* TESTCASE_1	addr	addr	found
                MACRO_SRST  DATA1_1,DATA1_2,36
* TESTCASE_2	addr	addr	not found
                MACRO_SRST  DATA2_1,DATA2_2,36
                MACRO_SRST  DATA2_1,DATA2_2,0
* TESTCASE_3	addr	addr	cpu-determined
                MACRO_SRST  DATA3_1,DATA3_2,256
                BR          14
REG_INIT DC X'0416041600000000'
STR_INIT DC C'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ '
DATA1_1 DC X'000000'
 DC C'A'
DATA1_2 DC C'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ '
DATA2_1 DC X'000000'
 DC C'+'
DATA2_2 DC C'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ '
DATA3_1 DC X'000000'
 DC C'+'
DATA3_2 DC C'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ '
 DC CL256' '
 DC CL256' '
                END
