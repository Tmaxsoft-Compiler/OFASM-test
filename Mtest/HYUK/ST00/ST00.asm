*************************************************
* FILENAME : ST00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 258 
*************************************************
                MACRO
                MACRO_ST_DS  &RVALUE,&LVALUE
                LG           2,&RVALUE
                MVC          RESULT_DS,&LVALUE
                OFADBGREG    2
                OFADBGMEM    RESULT_DS,0
                ST           2,RESULT_DS
                OFADBGREG    2
                OFADBGMEM    RESULT_DS,0
                MEND
                MACRO
                MACRO_ST_DC &RVALUE,&LVALUE
                LG          2,&RVALUE
                MVC         RESULT_DC,&LVALUE
                OFADBGREG   2
                OFADBGMEM   RESULT_DC,0
                ST          2,RESULT_DC
                OFADBGREG   2
                OFADBGMEM   RESULT_DC,0
                MEND
                MACRO
                MACRO_ST_LT &RVALUE,&LVALUE
                LG          2,&RVALUE
                LA          3,=C'LTRL'
                MVC         0(4,3),&LVALUE
                OFADBGREG   2
                OFADBGMEM   =C'LTRL',0
                ST          2,=C'LTRL'
                OFADBGREG   2
                OFADBGMEM   =C'LTRL',0
                MEND
                MACRO
                MACRO_ST_XBD &RVALUE,&LVALUE
                LG          2,&RVALUE
                MVC         RESULT_DS,&LVALUE
                MVC         RESULT_DC,&LVALUE
                LA          3,=C'LTRL'
                MVC         0(4,3),&LVALUE
                LA          3,RESULT_DS
                OFADBGREG   2
                OFADBGMEM   0(4,3),0
                ST          2,0(0,3)
                OFADBGREG   2
                OFADBGMEM   0(4,3),0
                LA          3,RESULT_DC
                OFADBGREG   2
                OFADBGMEM   0(4,3),0
                ST          2,0(0,3)
                OFADBGREG   2
                OFADBGMEM   0(4,3),0
                LA          3,=C'LTRL'
                OFADBGREG   2
                OFADBGMEM   0(4,3),0
                ST          2,0(0,3)
                OFADBGREG   2
                OFADBGMEM   0(4,3),0
                MEND
ST00            CSECT
                LR          12,15
                USING       ST00,12
* TESTCASE_1	binary	32bits	binary	32bits	ds
                MACRO_ST_DS  DATA1_1,DATA1_2
* TESTCASE_2	binary	32bits	binary	32bits	dc
                MACRO_ST_DC  DATA2_1,DATA2_2
* TESTCASE_3	binary	32bits	binary	32bits	literal
*                MACRO_ST_LT  DATA3_1,DATA3_2
* TESTCASE_4	binary	32bits	binary	32bits	XBDDD
                MACRO_ST_XBD DATA4_1,DATA4_2
* TESTCASE_5	binary	32bits	binary	otherwise	ds
                MACRO_ST_DS  DATA5_1,DATA5_2
* TESTCASE_6	binary	32bits	binary	otherwise	dc
                MACRO_ST_DC  DATA6_1,DATA6_2
* TESTCASE_7	binary	32bits	binary	otherwise	literal
*                MACRO_ST_LT  DATA7_1,DATA7_2
* TESTCASE_8	binary	32bits	binary	otherwise	XBDDD
                MACRO_ST_XBD DATA8_1,DATA8_2
* TESTCASE_9	binary	otherwise	binary	32bits	ds
                MACRO_ST_DS  DATA9_1,DATA9_2
* TESTCASE_10	binary	otherwise	binary	32bits	dc
                MACRO_ST_DC  DATA10_1,DATA10_2
* TESTCASE_11	binary	otherwise	binary	32bits	literal
*                MACRO_ST_LT  DATA11_1,DATA11_2
* TESTCASE_12	binary	otherwise	binary	32bits	XBDDD
                MACRO_ST_XBD DATA12_1,DATA12_2
* TESTCASE_13	binary	otherwise	binary	otherwise	ds
                MACRO_ST_DS  DATA13_1,DATA13_2
* TESTCASE_14	binary	otherwise	binary	otherwise	dc
                MACRO_ST_DC  DATA14_1,DATA14_2
* TESTCASE_15	binary	otherwise	binary	otherwise	literal
*                MACRO_ST_LT  DATA15_1,DATA15_2
* TESTCASE_16	binary	otherwise	binary	otherwise	XBDDD
                MACRO_ST_XBD DATA16_1,DATA16_2
                BR          14
REG_INIT DC X'0416041600000000'
RESULT_DS DS XL4
RESULT_DC DC XL4'00'
DATA1_1 DC X'0416041604160416'
DATA1_2 DC X'00000000'
DATA2_1 DC X'0416041601234567'
DATA2_2 DC X'00000000'
DATA3_1 DC X'0416041689ABCDEF'
DATA3_2 DC X'00000000'
DATA4_1 DC X'04160416FEDCBA98'
DATA4_2 DC X'00000000'
DATA5_1 DC X'0416041676543210'
DATA5_2 DC X'0000000000000000'
DATA6_1 DC X'0416041601020304'
DATA6_2 DC X'0000000000000000'
DATA7_1 DC X'0416041605060708'
DATA7_2 DC X'0000000000000000'
DATA8_1 DC X'04160416090A0B0C'
DATA8_2 DC X'0000000000000000'
DATA9_1 DC X'0416041604160416'
DATA9_2 DC X'00000000'
DATA10_1 DC X'0416041601234567'
DATA10_2 DC X'00000000'
DATA11_1 DC X'0416041689ABCDEF'
DATA11_2 DC X'00000000'
DATA12_1 DC X'04160416FEDCBA98'
DATA12_2 DC X'00000000'
DATA13_1 DC X'0416041676543210'
DATA13_2 DC X'0000000000000000'
DATA14_1 DC X'0416041601020304'
DATA14_2 DC X'0000000000000000'
DATA15_1 DC X'0416041605060708'
DATA15_2 DC X'0000000000000000'
DATA16_1 DC X'04160416090A0B0C'
DATA16_2 DC X'0000000000000000'
                END
