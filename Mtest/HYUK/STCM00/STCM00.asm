*************************************************
* FILENAME : STCM00.asm
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
                STCM         2,&MASK,RESULT_DS
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
STCM00          CSECT
                LR          12,15
                USING       STCM00,12
* TESTCASE_1	bin	32bits	bin	32bits	ds	0
                MACRO_STCM_DS  DATA1,DATA2,MASK#0
* TESTCASE_2	bin	32bits	bin	32bits	ds	1,2,4,8
                MACRO_STCM_DS  DATA1,DATA2,MASK#8
* TESTCASE_3	bin	32bits	bin	32bits	ds	3,5,6,9,10,12
                MACRO_STCM_DS  DATA1,DATA2,MASK#12
* TESTCASE_4	bin	32bits	bin	32bits	ds	7,11,13,14
                MACRO_STCM_DS  DATA1,DATA2,MASK#14
* TESTCASE_5	bin	32bits	bin	32bits	ds	15
                MACRO_STCM_DS  DATA1,DATA2,MASK#15
* TESTCASE_6	bin	32bits	bin	32bits	dc	0
                MACRO_STCM_DC  DATA1,DATA2,MASK#0
* TESTCASE_7	bin	32bits	bin	32bits	dc	1,2,4,8
                MACRO_STCM_DC  DATA1,DATA2,MASK#8
* TESTCASE_8	bin	32bits	bin	32bits	dc	3,5,6,9,10,12
                MACRO_STCM_DC  DATA1,DATA2,MASK#12
* TESTCASE_9	bin	32bits	bin	32bits	dc	7,11,13,14
                MACRO_STCM_DC  DATA1,DATA2,MASK#14
* TESTCASE_10	bin	32bits	bin	32bits	dc	15
                MACRO_STCM_DC  DATA1,DATA2,MASK#15
* TESTCASE_11	bin	32bits	bin	32bits	literal	0
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#0
* TESTCASE_12	bin	32bits	bin	32bits	literal	1,2,4,8
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#8
* TESTCASE_13	bin	32bits	bin	32bits	literal	3,5,6,9,10,12
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#12
* TESTCASE_14	bin	32bits	bin	32bits	literal	7,11,13,14
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#14
* TESTCASE_15	bin	32bits	bin	32bits	literal	15
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#15
* TESTCASE_16	bin	32bits	bin	32bits	BDDD	0
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#0
* TESTCASE_17	bin	32bits	bin	32bits	BDDD	1,2,4,8
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#8
* TESTCASE_18	bin	32bits	bin	32bits	BDDD	3,5,6,9,10,12
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#12
* TESTCASE_19	bin	32bits	bin	32bits	BDDD	7,11,13,14
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#14
* TESTCASE_20	bin	32bits	bin	32bits	BDDD	15
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#15
* TESTCASE_21	bin	32bits	bin	otherwise	ds	0
                MACRO_STCM_DS  DATA1,DATA2,MASK#0
* TESTCASE_22	bin	32bits	bin	otherwise	ds	1,2,4,8
                MACRO_STCM_DS  DATA1,DATA2,MASK#8
* TESTCASE_23	bin	32bits	bin	otherwise	ds	3,5,6,9,10,12
                MACRO_STCM_DS  DATA1,DATA2,MASK#12
* TESTCASE_24	bin	32bits	bin	otherwise	ds	7,11,13,14
                MACRO_STCM_DS  DATA1,DATA2,MASK#14
* TESTCASE_25	bin	32bits	bin	otherwise	ds	15
                MACRO_STCM_DS  DATA1,DATA2,MASK#15
* TESTCASE_26	bin	32bits	bin	otherwise	dc	0
                MACRO_STCM_DC  DATA1,DATA2,MASK#0
* TESTCASE_27	bin	32bits	bin	otherwise	dc	1,2,4,8
                MACRO_STCM_DC  DATA1,DATA2,MASK#8
* TESTCASE_28	bin	32bits	bin	otherwise	dc	3,5,6,9,10,12
                MACRO_STCM_DC  DATA1,DATA2,MASK#12
* TESTCASE_29	bin	32bits	bin	otherwise	dc	7,11,13,14
                MACRO_STCM_DC  DATA1,DATA2,MASK#14
* TESTCASE_30	bin	32bits	bin	otherwise	dc	15
                MACRO_STCM_DC  DATA1,DATA2,MASK#15
* TESTCASE_31	bin	32bits	bin	otherwise	literal	0
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#0
* TESTCASE_32	bin	32bits	bin	otherwise	literal	1,2,4,8
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#8
* TESTCASE_33	bin	32bits	bin	otherwise	literal	3,5,6,9,10,12
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#12
* TESTCASE_34	bin	32bits	bin	otherwise	literal	7,11,13,14
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#14
* TESTCASE_35	bin	32bits	bin	otherwise	literal	15
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#15
* TESTCASE_36	bin	32bits	bin	otherwise	BDDD	0
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#0
* TESTCASE_37	bin	32bits	bin	otherwise	BDDD	1,2,4,8
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#8
* TESTCASE_38	bin	32bits	bin	otherwise	BDDD	3,5,6,9,10,12
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#12
* TESTCASE_39	bin	32bits	bin	otherwise	BDDD	7,11,13,14
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#14
* TESTCASE_40	bin	32bits	bin	otherwise	BDDD	15
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#15
* TESTCASE_41	bin	otherwise	bin	32bits	ds	0
                MACRO_STCM_DS  DATA1,DATA2,MASK#0
* TESTCASE_42	bin	otherwise	bin	32bits	ds	1,2,4,8
                MACRO_STCM_DS  DATA1,DATA2,MASK#8
* TESTCASE_43	bin	otherwise	bin	32bits	ds	3,5,6,9,10,12
                MACRO_STCM_DS  DATA1,DATA2,MASK#12
* TESTCASE_44	bin	otherwise	bin	32bits	ds	7,11,13,14
                MACRO_STCM_DS  DATA1,DATA2,MASK#14
* TESTCASE_45	bin	otherwise	bin	32bits	ds	15
                MACRO_STCM_DS  DATA1,DATA2,MASK#15
* TESTCASE_46	bin	otherwise	bin	32bits	dc	0
                MACRO_STCM_DC  DATA1,DATA2,MASK#0
* TESTCASE_47	bin	otherwise	bin	32bits	dc	1,2,4,8
                MACRO_STCM_DC  DATA1,DATA2,MASK#8
* TESTCASE_48	bin	otherwise	bin	32bits	dc	3,5,6,9,10,12
                MACRO_STCM_DC  DATA1,DATA2,MASK#12
* TESTCASE_49	bin	otherwise	bin	32bits	dc	7,11,13,14
                MACRO_STCM_DC  DATA1,DATA2,MASK#14
* TESTCASE_50	bin	otherwise	bin	32bits	dc	15
                MACRO_STCM_DC  DATA1,DATA2,MASK#15
* TESTCASE_51	bin	otherwise	bin	32bits	literal	0
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#0
* TESTCASE_52	bin	otherwise	bin	32bits	literal	1,2,4,8
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#8
* TESTCASE_53	bin	otherwise	bin	32bits	literal	3,5,6,9,10,12
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#12
* TESTCASE_54	bin	otherwise	bin	32bits	literal	7,11,13,14
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#14
* TESTCASE_55	bin	otherwise	bin	32bits	literal	15
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#15
* TESTCASE_56	bin	otherwise	bin	32bits	BDDD	0
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#0
* TESTCASE_57	bin	otherwise	bin	32bits	BDDD	1,2,4,8
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#8
* TESTCASE_58	bin	otherwise	bin	32bits	BDDD	3,5,6,9,10,12
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#12
* TESTCASE_59	bin	otherwise	bin	32bits	BDDD	7,11,13,14
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#14
* TESTCASE_60	bin	otherwise	bin	32bits	BDDD	15
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#15
* TESTCASE_61	bin	otherwise	bin	otherwise	ds	0
                MACRO_STCM_DS  DATA1,DATA2,MASK#0
* TESTCASE_62	bin	otherwise	bin	otherwise	ds	1,2,4,8
                MACRO_STCM_DS  DATA1,DATA2,MASK#8
* TESTCASE_63	bin	otherwise	bin	otherwise	ds	3,5,6,9,10,12
                MACRO_STCM_DS  DATA1,DATA2,MASK#12
* TESTCASE_64	bin	otherwise	bin	otherwise	ds	7,11,13,14
                MACRO_STCM_DS  DATA1,DATA2,MASK#14
* TESTCASE_65	bin	otherwise	bin	otherwise	ds	15
                MACRO_STCM_DS  DATA1,DATA2,MASK#15
* TESTCASE_66	bin	otherwise	bin	otherwise	dc	0
                MACRO_STCM_DC  DATA1,DATA2,MASK#0
* TESTCASE_67	bin	otherwise	bin	otherwise	dc	1,2,4,8
                MACRO_STCM_DC  DATA1,DATA2,MASK#8
* TESTCASE_68	bin	otherwise	bin	otherwise	dc	3,5,6,9,10,12
                MACRO_STCM_DC  DATA1,DATA2,MASK#12
* TESTCASE_69	bin	otherwise	bin	otherwise	dc	7,11,13,14
                MACRO_STCM_DC  DATA1,DATA2,MASK#14
* TESTCASE_70	bin	otherwise	bin	otherwise	dc	15
                MACRO_STCM_DC  DATA1,DATA2,MASK#15
* TESTCASE_71	bin	otherwise	bin	otherwise	literal	0
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#0
* TESTCASE_72	bin	otherwise	bin	otherwise	literal	1,2,4,8
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#8
* TESTCASE_73	bin	otherwise	bin	otherwise	literal	3,5,6,9,10,12
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#12
* TESTCASE_74	bin	otherwise	bin	otherwise	literal	7,11,13,14
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#14
* TESTCASE_75	bin	otherwise	bin	otherwise	literal	15
*                MACRO_STCM_LITERAL  DATA1,DATA2,MASK#15
* TESTCASE_76	bin	otherwise	bin	otherwise	BDDD	0
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#0
* TESTCASE_77	bin	otherwise	bin	otherwise	BDDD	1,2,4,8
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#8
* TESTCASE_78	bin	otherwise	bin	otherwise	BDDD	3,5,6,9,10,12
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#12
* TESTCASE_79	bin	otherwise	bin	otherwise	BDDD	7,11,13,14
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#14
* TESTCASE_80	bin	otherwise	bin	otherwise	BDDD	15
                MACRO_STCM_BDDD  DATA1,DATA2,MASK#15
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
