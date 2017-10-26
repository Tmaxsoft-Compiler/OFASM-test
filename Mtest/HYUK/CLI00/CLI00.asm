*************************************************
* FILENAME : CLI00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 169
*************************************************
                MACRO
                MACRO_CLI   &VALUE1,&VALUE2
                MVI         =X'00',&VALUE2
                OFADBGMEM   &VALUE1,0
                OFADBGMEM   =X'00',0
                CLI         &VALUE1,&VALUE2
                OFADBGMEM   &VALUE1,0
                OFADBGMEM   =X'00',0
                OFADBGREG   2
                MEND
CLI00           CSECT
                LR          12,15
                USING       CLI00,12
* TESTCASE_1	unsigned	1byte>	unsigned	1byte>	oprand1=oprand2
                MACRO_CLI   DATA1_1,DATA1_2
* TESTCASE_2	unsigned	1byte>	unsigned	1byte>	oprand1<oprand2
                MACRO_CLI   DATA2_1,DATA2_2
* TESTCASE_3	unsigned	1byte>	unsigned	1byte>	oprand1>oprand2
                MACRO_CLI   DATA3_1,DATA3_2
* TESTCASE_4	unsigned	1byte>	unsigned	1byte	oprand1=oprand2
                MACRO_CLI   DATA4_1,DATA4_2
* TESTCASE_5	unsigned	1byte>	unsigned	1byte	oprand1<oprand2
                MACRO_CLI   DATA5_1,DATA5_2
* TESTCASE_6	unsigned	1byte>	unsigned	1byte	oprand1>oprand2
                MACRO_CLI   DATA6_1,DATA6_2
* TESTCASE_7	unsigned	1byte>	unsigned	1byte<	oprand1=oprand2
                MACRO_CLI   DATA7_1,DATA7_2
* TESTCASE_8	unsigned	1byte>	unsigned	1byte<	oprand1<oprand2
                MACRO_CLI   DATA8_1,DATA8_2
* TESTCASE_9	unsigned	1byte>	unsigned	1byte<	oprand1>oprand2
                MACRO_CLI   DATA9_1,DATA9_2
* TESTCASE_10	unsigned	1byte	unsigned	1byte>	oprand1=oprand2
                MACRO_CLI   DATA10_1,DATA10_2
* TESTCASE_11	unsigned	1byte	unsigned	1byte>	oprand1<oprand2
                MACRO_CLI   DATA11_1,DATA11_2
* TESTCASE_12	unsigned	1byte	unsigned	1byte>	oprand1>oprand2
                MACRO_CLI   DATA12_1,DATA12_2
* TESTCASE_13	unsigned	1byte	unsigned	1byte	oprand1=oprand2
                MACRO_CLI   DATA13_1,DATA13_2
* TESTCASE_14	unsigned	1byte	unsigned	1byte	oprand1<oprand2
                MACRO_CLI   DATA14_1,DATA14_2
* TESTCASE_15	unsigned	1byte	unsigned	1byte	oprand1>oprand2
                MACRO_CLI   DATA15_1,DATA15_2
* TESTCASE_16	unsigned	1byte	unsigned	1byte<	oprand1=oprand2
                MACRO_CLI   DATA16_1,DATA16_2
* TESTCASE_17	unsigned	1byte	unsigned	1byte<	oprand1<oprand2
                MACRO_CLI   DATA17_1,DATA17_2
* TESTCASE_18	unsigned	1byte	unsigned	1byte<	oprand1>oprand2
                MACRO_CLI   DATA18_1,DATA18_2
* TESTCASE_19	unsigned	1byte<	unsigned	1byte>	oprand1=oprand2
                MACRO_CLI   DATA19_1,DATA19_2
* TESTCASE_20	unsigned	1byte<	unsigned	1byte>	oprand1<oprand2
                MACRO_CLI   DATA20_1,DATA20_2
* TESTCASE_21	unsigned	1byte<	unsigned	1byte>	oprand1>oprand2
                MACRO_CLI   DATA21_1,DATA21_2
* TESTCASE_22	unsigned	1byte<	unsigned	1byte	oprand1=oprand2
                MACRO_CLI   DATA22_1,DATA22_2
* TESTCASE_23	unsigned	1byte<	unsigned	1byte	oprand1<oprand2
                MACRO_CLI   DATA23_1,DATA23_2
* TESTCASE_24	unsigned	1byte<	unsigned	1byte	oprand1>oprand2
                MACRO_CLI   DATA24_1,DATA24_2
* TESTCASE_25	unsigned	1byte<	unsigned	1byte<	oprand1=oprand2
                MACRO_CLI   DATA25_1,DATA25_2
* TESTCASE_26	unsigned	1byte<	unsigned	1byte<	oprand1<oprand2
                MACRO_CLI   DATA26_1,DATA26_2
* TESTCASE_27	unsigned	1byte<	unsigned	1byte<	oprand1>oprand2
                MACRO_CLI   DATA27_1,DATA27_2
                BR          14
DATA1_1 DC X'A'
DATA1_2 EQU X'A'
DATA2_1 DC X'A'
DATA2_2 EQU X'F'
DATA3_1 DC X'A'
DATA3_2 EQU X'1'
DATA4_1 DC X'A'
DATA4_2 EQU X'0A'
DATA5_1 DC X'A'
DATA5_2 EQU X'0F'
DATA6_1 DC X'A'
DATA6_2 EQU X'01'
DATA7_1 DC X'A'
DATA7_2 EQU X'FF0A'
DATA8_1 DC X'A'
DATA8_2 EQU X'FF0F'
DATA9_1 DC X'A'
DATA9_2 EQU X'FF01'
DATA10_1 DC X'A9'
DATA10_2 EQU X'A'
DATA11_1 DC X'A9'
DATA11_2 EQU X'F'
DATA12_1 DC X'A9'
DATA12_2 EQU X'1'
DATA13_1 DC X'A9'
DATA13_2 EQU X'A9'
DATA14_1 DC X'A9'
DATA14_2 EQU X'FE'
DATA15_1 DC X'A9'
DATA15_2 EQU X'01'
DATA16_1 DC X'A9'
DATA16_2 EQU X'FFA9'
DATA17_1 DC X'A9'
DATA17_2 EQU X'FFFE'
DATA18_1 DC X'A9'
DATA18_2 EQU X'FF01'
DATA19_1 DC X'A987'
DATA19_2 EQU X'A'
DATA20_1 DC X'A987'
DATA20_2 EQU X'F'
DATA21_1 DC X'A987'
DATA21_2 EQU X'1'
DATA22_1 DC X'A987'
DATA22_2 EQU X'A9'
DATA23_1 DC X'A987'
DATA23_2 EQU X'FE'
DATA24_1 DC X'A987'
DATA24_2 EQU X'01'
DATA25_1 DC X'A987'
DATA25_2 EQU X'A987'
DATA26_1 DC X'A987'
DATA26_2 EQU X'A998'
DATA27_1 DC X'A987'
DATA27_2 EQU X'A967'
                END
