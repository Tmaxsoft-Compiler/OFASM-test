*************************************************
* FILENAME : MH01.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 258 
*************************************************
                MACRO
                MACRO_MH    &REGNUM,&VALUE1,&VALUE2
                LG          &REGNUM,&VALUE1
                OFADBGREG   &REGNUM
                OFADBGMEM   &VALUE2,0
                MH          &REGNUM,&VALUE2
                OFADBGREG   &REGNUM
                OFADBGMEM   &VALUE2,0
                MEND
MH01            CSECT
                LR          12,15
                USING       MH01,12
* TESTCASE_1	invalid Rn	ERROR
                MACRO_MH    DATA1_REGNUM,DATA1_1,DATA1_2
                BR          14
DATA1_REGNUM EQU 16
DATA1_1 DC X'0416041600000000'
DATA1_2 DC X'0000000000000000'
                END
