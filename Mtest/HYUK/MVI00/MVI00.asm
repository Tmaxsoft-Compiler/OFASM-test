*************************************************
* FILENAME : MVI00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 169
*************************************************
                MACRO
                MACRO_MVI   &VALUE1,&VALUE2,&LEN1,&LEN2
                OFADBGMEM   &VALUE1,0
                LGHI        2,&VALUE2
                OFADBGREG   2
                MVI         &VALUE1,&VALUE2
                OFADBGMEM   &VALUE1,0
                OFADBGREG   2
                MEND
MVI00           CSECT
                LR          12,15
                USING       MVI00,12
* TESTCASE_1	binary	1byte>	binary	1byte>
                MACRO_MVI   DATA1_1,DATA1_2
* TESTCASE_2	binary	1byte>	binary	1byte
                MACRO_MVI   DATA2_1,DATA2_2
* TESTCASE_3	binary	1byte>	binary	1byte<
                MACRO_MVI   DATA3_1,DATA3_2
* TESTCASE_4	binary	1byte	binary	1byte>
                MACRO_MVI   DATA4_1,DATA4_2
* TESTCASE_5	binary	1byte	binary	1byte
                MACRO_MVI   DATA5_1,DATA5_2
* TESTCASE_6	binary	1byte	binary	1byte<
                MACRO_MVI   DATA6_1,DATA6_2
* TESTCASE_7	binary	1byte<	binary	1byte>
                MACRO_MVI   DATA7_1,DATA7_2
* TESTCASE_8	binary	1byte<	binary	1byte
                MACRO_MVI   DATA8_1,DATA8_2
* TESTCASE_9	binary	1byte<	binary	1byte<
                MACRO_MVI   DATA9_1,DATA9_2
                BR          14
DATA1_1 DC X'F'
DATA1_2 EQU X'1'
DATA2_1 DC X'E'
DATA2_2 EQU X'23'
DATA3_1 DC X'D'
DATA3_2 EQU X'4567'
DATA4_1 DC X'CB'
DATA4_2 EQU X'8'
DATA5_1 DC X'A9'
DATA5_2 EQU X'9A'
DATA6_1 DC X'87'
DATA6_2 EQU X'BCDE'
DATA7_1 DC X'6543'
DATA7_2 EQU X'F'
DATA8_1 DC X'21FE'
DATA8_2 EQU X'12'
DATA9_1 DC X'DCBA'
DATA9_2 EQU X'3456'
                END
