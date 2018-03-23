*************************************************
* FILENAME : MR01.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 258 
*************************************************
                MACRO
                MACRO_MR    &REGNUM,&VALUE1,&VALUE2
                LG          &REGNUM,EVENREG_INIT
                LG          &REGNUM+1,&VALUE1
                LG          &REGNUM+2,&VALUE2
                OFADBGREG   &REGNUM
                OFADBGREG   &REGNUM+1
                OFADBGREG   &REGNUM+2
                MR          &REGNUM,&REGNUM+2
                OFADBGREG   &REGNUM
                OFADBGREG   &REGNUM+1
                OFADBGREG   &REGNUM+2
                MEND
MR01            CSECT
                LR          12,15
                USING       MR01,12
* TESTCASE_1	invalid Rn	ERROR
                MACRO_MR    REGNUM#16,DATA1,DATA2
* TESTCASE_73	odd Rn	ERROR
                MACRO_MR    REGNUM#0,DATA1,DATA2
                MACRO_MR    REGNUM#1,DATA1,DATA2
                MACRO_MR    REGNUM#2,DATA1,DATA2
                MACRO_MR    REGNUM#3,DATA1,DATA2
                MACRO_MR    REGNUM#4,DATA1,DATA2
                MACRO_MR    REGNUM#5,DATA1,DATA2
                MACRO_MR    REGNUM#6,DATA1,DATA2
                MACRO_MR    REGNUM#7,DATA1,DATA2
                MACRO_MR    REGNUM#8,DATA1,DATA2
                MACRO_MR    REGNUM#9,DATA1,DATA2
                MACRO_MR    REGNUM#10,DATA1,DATA2
                MACRO_MR    REGNUM#11,DATA1,DATA2
                MACRO_MR    REGNUM#12,DATA1,DATA2
                MACRO_MR    REGNUM#13,DATA1,DATA2
                MACRO_MR    REGNUM#14,DATA1,DATA2
                MACRO_MR    REGNUM#15,DATA1,DATA2
                BR          14
EVENREG_INIT DC X'0416041604160416'
DATA1 DC X'0000000000000000'
DATA2 DC X'0000000000000000'
REGNUM#0 EQU 0
REGNUM#1 EQU 1
REGNUM#2 EQU 2
REGNUM#3 EQU 3
REGNUM#4 EQU 4
REGNUM#5 EQU 5
REGNUM#6 EQU 6
REGNUM#7 EQU 7
REGNUM#8 EQU 8
REGNUM#9 EQU 9
REGNUM#10 EQU 10
REGNUM#11 EQU 11
REGNUM#12 EQU 12
REGNUM#13 EQU 13
REGNUM#14 EQU 14
REGNUM#15 EQU 15
REGNUM#16 EQU 16
                END
