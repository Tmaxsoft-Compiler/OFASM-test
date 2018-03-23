*************************************************
* FILENAME : SLDA01.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 258 
*************************************************
                MACRO
                MACRO_SLDA  &REGNUM,&VALUE,&NUM
                LG          &REGNUM,REG_INIT
                LG          &REGNUM+1,REG_INIT
                L           &REGNUM,&VALUE
                L           &REGNUM+1,&VALUE+4
                OFADBGREG   &REGNUM
                OFADBGREG   &REGNUM+1
                SLDA        &REGNUM,&NUM
                OFADBGREG   &REGNUM
                OFADBGREG   &REGNUM+1
                MEND
SLDA01          CSECT
                LR          12,15
                USING       SLDA01,12
* TESTCASE_1	invalid Rn	ERROR
                MACRO_SLDA  DATA1_REGNUM,DATA1_1,DATA1_2
* TESTCASE_49	odd Rn	ERROR
                MACRO_SLDA  REGNUM#1,DATA12_1,DATA12_2
                MACRO_SLDA  REGNUM#3,DATA12_1,DATA12_2
                MACRO_SLDA  REGNUM#5,DATA12_1,DATA12_2
                MACRO_SLDA  REGNUM#7,DATA12_1,DATA12_2
                MACRO_SLDA  REGNUM#9,DATA12_1,DATA12_2
                MACRO_SLDA  REGNUM#11,DATA12_1,DATA12_2
                MACRO_SLDA  REGNUM#13,DATA12_1,DATA12_2
                MACRO_SLDA  REGNUM#15,DATA12_1,DATA12_2
                BR          14
REG_INIT DC X'0416041600000000'
DATA1_REGNUM EQU 16
DATA1_1 DC X'0000000000000000'
DATA1_2 EQU 32
REGNUM#1 EQU 1
REGNUM#3 EQU 3
REGNUM#5 EQU 5
REGNUM#7 EQU 7
REGNUM#9 EQU 9
REGNUM#11 EQU 11
REGNUM#13 EQU 13
REGNUM#15 EQU 15
DATA12_1 DC X'0000000000000000'
DATA12_2 EQU 32
                END
