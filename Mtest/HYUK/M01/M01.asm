*************************************************
* FILENAME : M01.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 258 
*************************************************
                MACRO
                MACRO_M     &REGNUM,&VALUE1,&VALUE2
                LG          &REGNUM,EVENREG_INIT
                LG          &REGNUM+1,&VALUE1
                OFADBGREG   &REGNUM
                OFADBGREG   &REGNUM+1
                OFADBGMEM   &VALUE2,0
                M           &REGNUM,&VALUE2
                OFADBGREG   &REGNUM
                OFADBGREG   &REGNUM+1
                OFADBGMEM   &VALUE2,0
                MEND
M01             CSECT
                LR          12,15
                USING       M01,12
* TESTCASE_1	invalid Rn	ERROR
                MACRO_M     REGNUM#16,DATA1,DATA2
* TESTCASE_73	odd Rn	ERROR
                MACRO_M     REGNUM#0,DATA1,DATA2
                MACRO_M     REGNUM#1,DATA1,DATA2
                MACRO_M     REGNUM#2,DATA1,DATA2
                MACRO_M     REGNUM#3,DATA1,DATA2
                MACRO_M     REGNUM#4,DATA1,DATA2
                MACRO_M     REGNUM#5,DATA1,DATA2
                MACRO_M     REGNUM#6,DATA1,DATA2
                MACRO_M     REGNUM#7,DATA1,DATA2
                MACRO_M     REGNUM#8,DATA1,DATA2
                MACRO_M     REGNUM#9,DATA1,DATA2
                MACRO_M     REGNUM#10,DATA1,DATA2
                MACRO_M     REGNUM#11,DATA1,DATA2
                MACRO_M     REGNUM#12,DATA1,DATA2
                MACRO_M     REGNUM#13,DATA1,DATA2
                MACRO_M     REGNUM#14,DATA1,DATA2
                MACRO_M     REGNUM#15,DATA1,DATA2
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
