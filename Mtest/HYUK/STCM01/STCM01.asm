*************************************************
* FILENAME : STCM01.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 258 
*************************************************
                MACRO
                MACRO_STCM_DS  &RVALUE,&LVALUE,&MASK
                LG           2,REG_INIT
                LHI          2,&MASK
                OFADBGREG    2
                LG           2,&RVALUE
                MVC          RESULT_DS,&LVALUE
                OFADBGREG    2
                OFADBGMEM    RESULT_DS,0
                STCM         2,&MASK,RESULT_DS,&MASK
                OFADBGREG    2
                OFADBGMEM    RESULT_DS,0
                MEND
                MACRO
                MACRO_STCM_DC &RVALUE,&LVALUE,&MASK
                LG          2,REG_INIT
                LHI         2,&MASK
                OFADBGREG   2
                LG          2,&RVALUE
                MVC         RESULT_DC,&LVALUE
                OFADBGREG   2
                OFADBGMEM   RESULT_DC,0
                STCM        2,&MASK,RESULT_DC
                OFADBGREG   2
                OFADBGMEM   RESULT_DC,0
                MEND
                MACRO
                MACRO_STCM_LITERAL &RVALUE,&LVALUE,&MASK
                LG          2,REG_INIT
                LHI         2,&MASK
                OFADBGREG   2
                LG          2,&RVALUE
                LA          3,=C'LTRL'
                MVC         0(4,3),&LVALUE
                OFADBGREG   2
                OFADBGMEM   =C'LTRL',0
                STCM        2,&MASK,=C'LTRL'
                OFADBGREG   2
                OFADBGMEM   =C'LTRL',0
                MEND
                MACRO
                MACRO_STCM_BDDD &RVALUE,&LVALUE,&MASK
                LG          2,REG_INIT
                LHI         2,&MASK
                OFADBGREG   2
                LG          2,&RVALUE
                MVC         RESULT_DS,&LVALUE
                MVC         RESULT_DC,&LVALUE
                LA          3,=C'LTRL'
                MVC         0(4,3),&LVALUE
                LA          3,RESULT_DS
                OFADBGREG   2
                OFADBGMEM   0(4,3),0
                STCM        2,&MASK,0(3)
                OFADBGREG   2
                OFADBGMEM   0(4,3),0
                LA          3,RESULT_DC
                OFADBGREG   2
                OFADBGMEM   0(4,3),0
                STCM        2,&MASK,0(3)
                OFADBGREG   2
                OFADBGMEM   0(4,3),0
                LA          3,=C'LTRL'
                OFADBGREG   2
                OFADBGMEM   0(4,3),0
                STCM        2,&MASK,0(3)
                OFADBGREG   2
                OFADBGMEM   0(4,3),0
                MEND
STCM01          CSECT
                LR          12,15
                USING       STCM01,12
                STCM        16,16,=C'LITERAL'
* TESTCASE_11	bin	32bits	bin	32bits	literal	0
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#0
* TESTCASE_12	bin	32bits	bin	32bits	literal	1,2,4,8
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#8
* TESTCASE_13	bin	32bits	bin	32bits	literal	3,5,6,9,10,12
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#12
* TESTCASE_14	bin	32bits	bin	32bits	literal	7,11,13,14
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#14
* TESTCASE_15	bin	32bits	bin	32bits	literal	15
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#15
* TESTCASE_31	bin	32bits	bin	otherwise	literal	0
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#0
* TESTCASE_32	bin	32bits	bin	otherwise	literal	1,2,4,8
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#8
* TESTCASE_33	bin	32bits	bin	otherwise	literal	3,5,6,9,10,12
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#12
* TESTCASE_34	bin	32bits	bin	otherwise	literal	7,11,13,14
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#14
* TESTCASE_35	bin	32bits	bin	otherwise	literal	15
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#15
* TESTCASE_51	bin	otherwise	bin	32bits	literal	0
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#0
* TESTCASE_52	bin	otherwise	bin	32bits	literal	1,2,4,8
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#8
* TESTCASE_53	bin	otherwise	bin	32bits	literal	3,5,6,9,10,12
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#12
* TESTCASE_54	bin	otherwise	bin	32bits	literal	7,11,13,14
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#14
* TESTCASE_55	bin	otherwise	bin	32bits	literal	15
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#15
* TESTCASE_71	bin	otherwise	bin	otherwise	literal	0
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#0
* TESTCASE_72	bin	otherwise	bin	otherwise	literal	1,2,4,8
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#8
* TESTCASE_73	bin	otherwise	bin	otherwise	literal	3,5,6,9,10,12
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#12
* TESTCASE_74	bin	otherwise	bin	otherwise	literal	7,11,13,14
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#14
* TESTCASE_75	bin	otherwise	bin	otherwise	literal	15
                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#15
                BR          14
REG_INIT DC X'0000000000000000'
RESULT_DS DS XL4
RESULT_DC DC XL4'00'
MASK#0 EQU 0
MASK#1 EQU 1
MASK#2 EQU 2
MASK#3 EQU 3
MASK#4 EQU 4
MASK#5 EQU 5
MASK#6 EQU 6
MASK#7 EQU 7
MASK#8 EQU 8
MASK#9 EQU 9
MASK#10 EQU 10
MASK#11 EQU 11
MASK#12 EQU 12
MASK#13 EQU 13
MASK#14 EQU 14
MASK#15 EQU 15
DATA1 DC X'0123456789ABCDEF'
DATA2 DC X'00000000'
                END
