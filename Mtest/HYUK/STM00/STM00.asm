*************************************************
* FILENAME : STM00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 258 
*************************************************
                MACRO
                ZERO_INIT_REG
                LM 12,1,ZERO_INIT
                MEND
                MACRO
                SAVE_REG
                STM 12,1,SAVE_REG
                MEND
                MACRO
                RESTORE_REG
                LM 12,1,SAVE_REG
                MEND
                MACRO
                MACRO_STM_DS &REGNUM_1,&REGNUM_2
                SAVE_REG
                LM         2,11,REG_DATA+8
                STM        &REGNUM_1,&REGNUM_2,RESULT_DS
                RESTORE_REG
                OFADBGMEM  RESULT_DS,0
                MEND
                MACRO
                MACRO_STM_DC &REGNUM_1,&REGNUM_2
                SAVE_REG
                LM         2,11,REG_DATA+8
                STM        &REGNUM_1,&REGNUM_2,RESULT_DC
                RESTORE_REG
                OFADBGMEM  RESULT_DC,0
                MEND
                MACRO
                MACRO_STM_LT &REGNUM_1,&REGNUM_2
                SAVE_REG
                LM         2,11,REG_DATA+8
                STM        &REGNUM_1,&REGNUM_2,=C'012345678901234567890X
               1234567890123456789012345678901234567890123'
                RESTORE_REG
                OFADBGMEM  =C'01234567890123456789012345678901234567890X
               12345678901234567890123',0
                MEND
                MACRO
                MACRO_STM_BD &REGNUM_1,&REGNUM_2
                SAVE_REG
                LM         3,11,REG_DATA+12
                LA         2,RESULT_DS
                STM        &REGNUM_1,&REGNUM_2,0(2)
                RESTORE_REG
                OFADBGMEM  RESULT_DS,0
                LA         2,RESULT_DC
                STM        &REGNUM_1,&REGNUM_2,0(2)
                RESTORE_REG
                OFADBGMEM  RESULT_DC,0
                LA         2,=C'012345678901234567890123456789012345678X
               9012345678901234567890123'
                STM        &REGNUM_1,&REGNUM_2,0(2)
                RESTORE_REG
                OFADBGMEM  =C'01234567890123456789012345678901234567890X
               12345678901234567890123',0
                MEND
STM00           CSECT
                LR          12,15
                USING       STM00,12
                LG          2,REG_INIT
                LG          3,REG_INIT
                LG          4,REG_INIT
                LG          5,REG_INIT
                LG          6,REG_INIT
                LG          7,REG_INIT
                LG          8,REG_INIT
                LG          9,REG_INIT
                LG          10,REG_INIT
                LG          11,REG_INIT
* TESTCASE_1	invalid Rn	ERROR
*                MACRO_STM_DS REGNUM#1_1,REGNUM#1_2
* TESTCASE_33	valid Rn		binary			ERROR
*                MACRO_STM_DS REGNUM#2_1,REGNUM#2_2
				
* TESTCASE_34	valid Rn	32bits	32bits	ds	valid Rn
                MACRO_STM_DS REGNUM#3_1,REGNUM#3_2
* TESTCASE_36	valid Rn	32bits	32bits	dc	valid Rn
                MACRO_STM_DC REGNUM#4_1,REGNUM#4_2
* TESTCASE_38	valid Rn	32bits	32bits	literal	valid Rn
                MACRO_STM_LT REGNUM#5_1,REGNUM#5_2
* TESTCASE_40	valid Rn	32bits	32bits	BDDD	valid Rn
                MACRO_STM_BD REGNUM#6_1,REGNUM#6_2
* TESTCASE_42	valid Rn	32bits	otherwise	ds	valid Rn
                MACRO_STM_DS REGNUM#7_1,REGNUM#7_2
* TESTCASE_44	valid Rn	32bits	otherwise	dc	valid Rn
                MACRO_STM_DC REGNUM#8_1,REGNUM#8_2
* TESTCASE_46	valid Rn	32bits	otherwise	literal	valid Rn
                MACRO_STM_LT REGNUM#9_1,REGNUM#9_2
* TESTCASE_48	valid Rn	32bits	otherwise	BDDD	valid Rn
                MACRO_STM_BD REGNUM#10_1,REGNUM#10_2
* TESTCASE_50	valid Rn	otherwise	32bits	ds	valid Rn
                MACRO_STM_DS REGNUM#11_1,REGNUM#11_2
* TESTCASE_52	valid Rn	otherwise	32bits	dc	valid Rn
                MACRO_STM_DC REGNUM#12_1,REGNUM#12_2
* TESTCASE_54	valid Rn	otherwise	32bits	literal	valid Rn
                MACRO_STM_LT REGNUM#13_1,REGNUM#13_2
* TESTCASE_56	valid Rn	otherwise	32bits	BDDD	valid Rn
                MACRO_STM_BD REGNUM#14_1,REGNUM#14_2
* TESTCASE_58	valid Rn	otherwise	otherwise	ds	valid Rn
                MACRO_STM_DS REGNUM#15_1,REGNUM#15_2
* TESTCASE_60	valid Rn	otherwise	otherwise	dc	valid Rn
                MACRO_STM_DC REGNUM#16_1,REGNUM#16_2
* TESTCASE_62	valid Rn	otherwise	otherwise	literal	valid Rn
                MACRO_STM_LT REGNUM#17_1,REGNUM#17_2
* TESTCASE_64	valid Rn	otherwise	otherwise	BDDD	valid Rn
                MACRO_STM_BD REGNUM#18_1,REGNUM#18_2
                BR          14
SAVE_REG DC XL64'00'

RESULT_DS DS XL64
RESULT_DC DC XL64'00'
REG_INIT DC X'0416041600000000'
ZERO_INIT DC XL24'00'
REG_DATA    DS 0XL64
REG_DATA#0  DC XL4'04160416'
REG_DATA#1  DC XL4'01234567'
REG_DATA#2  DC XL4'89ABCDEF'
REG_DATA#3  DC XL4'FEDCBA98'
REG_DATA#4  DC XL4'76543210'
REG_DATA#5  DC CL4'0123'
REG_DATA#6  DC CL4'4567'
REG_DATA#7  DC CL4'89AB'
REG_DATA#8  DC CL4'CDEF'
REG_DATA#9  DC CL4'GHIJ'
REG_DATA#10 DC CL4'KLMN'
REG_DATA#11 DC CL4'OPQR'
REG_DATA#12 DC CL4'STUV'
REG_DATA#13 DC CL4'WXYZ'
REG_DATA#14 DC XL4'04160416'
REG_DATA#15 DC XL4'12345678'

REGNUM#1_1 EQU 16
REGNUM#1_2 EQU 33
REGNUM#2_1 EQU 32
REGNUM#2_2 EQU 16
REGNUM#3_1 EQU 3 
REGNUM#3_2 EQU 3
REGNUM#4_1 EQU 3
REGNUM#4_2 EQU 4
REGNUM#5_1 EQU 3
REGNUM#5_2 EQU 5
REGNUM#6_1 EQU 3
REGNUM#6_2 EQU 6
REGNUM#7_1 EQU 3
REGNUM#7_2 EQU 7
REGNUM#8_1 EQU 3
REGNUM#8_2 EQU 8
REGNUM#9_1 EQU 3
REGNUM#9_2 EQU 9
REGNUM#10_1 EQU 3
REGNUM#10_2 EQU 10
REGNUM#11_1 EQU 3
REGNUM#11_2 EQU 11
REGNUM#12_1 EQU 4
REGNUM#12_2 EQU 4
REGNUM#13_1 EQU 4
REGNUM#13_2 EQU 5
REGNUM#14_1 EQU 4
REGNUM#14_2 EQU 6
REGNUM#15_1 EQU 4
REGNUM#15_2 EQU 7
REGNUM#16_1 EQU 4
REGNUM#16_2 EQU 8
REGNUM#17_1 EQU 4
REGNUM#17_2 EQU 9
REGNUM#18_1 EQU 4
REGNUM#18_2 EQU 10
                END
