*************************************************
* FILENAME : SLDL00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 258 
*************************************************
                MACRO
                MACRO_SLDL  &REGNUM,&VALUE,&NUM
                LG          &REGNUM,REG_INIT
                LG          &REGNUM+1,REG_INIT
                L           &REGNUM,&VALUE
                L           &REGNUM+1,&VALUE+4
                OFADBGREG   &REGNUM
                OFADBGREG   &REGNUM+1
                SLDL        &REGNUM,&NUM
                OFADBGREG   &REGNUM
                OFADBGREG   &REGNUM+1
                MEND
SLDL00          CSECT
                LR          12,15
                USING       SLDL00,12
* TESTCASE_1	invalid Rn	ERROR
*               MACRO_SLDL   DATA1_REGNUM,DATA1_1,DATA1_2
* TESTCASE_3	even Rn	binary	0~64
               MACRO_SLDL   DATA2_REGNUM,DATA2_1,DATA2_2
* TESTCASE_4	even Rn	binary	64<
               MACRO_SLDL   DATA3_REGNUM,DATA3_1,DATA3_2
* TESTCASE_5	odd Rn	ERROR
*               MACRO_SLDL   DATA4_REGNUM,DATA4_1,DATA4_2
                BR          14
REG_INIT DC X'0416041600000000'
DATA1_REGNUM EQU 16
DATA1_1 DC X'0123456789ABCDEF'
DATA1_2 EQU 32
DATA2_REGNUM EQU 2
DATA2_1 DC X'0123456789ABCDEF'
DATA2_2 EQU 32
DATA3_REGNUM EQU 2
DATA3_1 DC X'0123456789ABCDEF'
DATA3_2 EQU 96
DATA4_REGNUM EQU 3
DATA4_1 DC X'0123456789ABCDEF'
DATA4_2 EQU 32
                END
