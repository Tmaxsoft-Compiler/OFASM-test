*************************************************
* FILENAME : CL00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 169
*************************************************
        MACRO
        MACRO_CL    &VALUE1,&VALUE2
        LG          2,&VALUE1
        OFADBGREG   2
        OFADBGMEM   &VALUE2,0
        CL          2,&VALUE2
        OFADBGREG   2
        OFADBGMEM   &VALUE2,0
        MEND
CL00    CSECT
        LR          12,15
        USING       CL00,12
* TESTCASE_1	unsigned	16bits	unsigned	32bits>	oprand1=oprand2
                MACRO_CL    DATA1_1,DATA1_2
* TESTCASE_2	unsigned	16bits	unsigned	32bits>	oprand1<oprand2
                MACRO_CL    DATA2_1,DATA2_2
* TESTCASE_3	unsigned	16bits	unsigned	32bits>	oprand1>oprand2
                MACRO_CL    DATA3_1,DATA3_2
* TESTCASE_4	unsigned	16bits	unsigned	32bits	oprand1=oprand2
                MACRO_CL    DATA4_1,DATA4_2
* TESTCASE_5	unsigned	16bits	unsigned	32bits	oprand1<oprand2
                MACRO_CL    DATA5_1,DATA5_2
* TESTCASE_6	unsigned	16bits	unsigned	32bits	oprand1>oprand2
                MACRO_CL    DATA6_1,DATA6_2
* TESTCASE_7	unsigned	16bits	unsigned	32bits<	oprand1=oprand2
                MACRO_CL    DATA7_1,DATA7_2
* TESTCASE_8	unsigned	16bits	unsigned	32bits<	oprand1<oprand2
                MACRO_CL    DATA8_1,DATA8_2
* TESTCASE_9	unsigned	16bits	unsigned	32bits<	oprand1>oprand2
                MACRO_CL    DATA9_1,DATA9_2
* TESTCASE_10	unsigned	32bits	unsigned	32bits>	oprand1=oprand2
                MACRO_CL    DATA10_1,DATA10_2
* TESTCASE_11	unsigned	32bits	unsigned	32bits>	oprand1<oprand2
                MACRO_CL    DATA11_1,DATA11_2
* TESTCASE_12	unsigned	32bits	unsigned	32bits>	oprand1>oprand2
                MACRO_CL    DATA12_1,DATA12_2
* TESTCASE_13	unsigned	32bits	unsigned	32bits	oprand1=oprand2
                MACRO_CL    DATA13_1,DATA13_2
* TESTCASE_14	unsigned	32bits	unsigned	32bits	oprand1<oprand2
                MACRO_CL    DATA14_1,DATA14_2
* TESTCASE_15	unsigned	32bits	unsigned	32bits	oprand1>oprand2
                MACRO_CL    DATA15_1,DATA15_2
* TESTCASE_16	unsigned	32bits	unsigned	32bits<	oprand1=oprand2
                MACRO_CL    DATA16_1,DATA16_2
* TESTCASE_17	unsigned	32bits	unsigned	32bits<	oprand1<oprand2
                MACRO_CL    DATA17_1,DATA17_2
* TESTCASE_18	unsigned	32bits	unsigned	32bits<	oprand1>oprand2
                MACRO_CL    DATA18_1,DATA18_2
* TESTCASE_19	unsigned	64bits	unsigned	32bits>	oprand1=oprand2
                MACRO_CL    DATA19_1,DATA19_2
* TESTCASE_20	unsigned	64bits	unsigned	32bits>	oprand1<oprand2
                MACRO_CL    DATA20_1,DATA20_2
* TESTCASE_21	unsigned	64bits	unsigned	32bits>	oprand1>oprand2
                MACRO_CL    DATA21_1,DATA21_2
* TESTCASE_22	unsigned	64bits	unsigned	32bits	oprand1=oprand2
                MACRO_CL    DATA22_1,DATA22_2
* TESTCASE_23	unsigned	64bits	unsigned	32bits	oprand1<oprand2
                MACRO_CL    DATA23_1,DATA23_2
* TESTCASE_24	unsigned	64bits	unsigned	32bits	oprand1>oprand2
                MACRO_CL    DATA24_1,DATA24_2
* TESTCASE_25	unsigned	64bits	unsigned	32bits<	oprand1=oprand2
                MACRO_CL    DATA25_1,DATA25_2
* TESTCASE_26	unsigned	64bits	unsigned	32bits<	oprand1<oprand2
                MACRO_CL    DATA26_1,DATA26_2
* TESTCASE_27	unsigned	64bits	unsigned	32bits<	oprand1>oprand2
                MACRO_CL    DATA27_1,DATA27_2
        BR          14
DATA1_1 DC X'FEDCBA9876543210'
DATA1_2 DC X'3210'
DATA1_TEMP DC X'FEDC'
DATA2_1 DC X'FEDCBA9876543210'
DATA2_2 DC X'4321'
DATA2_TEMP DC X'FEDC'
DATA3_1 DC X'FEDCBA9876543210'
DATA3_2 DC X'2100'
DATA3_TEMP DC X'FEDC'
DATA4_1 DC X'FEDCBA9876543210'
DATA4_2 DC X'3210FEDC'
DATA5_1 DC X'FEDCBA9876543210'
DATA5_2 DC X'43210FED'
DATA6_1 DC X'FEDCBA9876543210'
DATA6_2 DC X'210FEDCB'
DATA7_1 DC X'FEDCBA9876543210'
DATA7_2 DC X'3210FEDCBA987654'
DATA8_1 DC X'FEDCBA9876543210'
DATA8_2 DC X'43210FEDCBA98765'
DATA9_1 DC X'FEDCBA9876543210'
DATA9_2 DC X'210FEDCBA9876543'
DATA10_1 DC X'FEDCBA9876543210'
DATA10_2 DC X'7654'
DATA10_TEMP DC X'FEDC'
DATA11_1 DC X'FEDCBA9876543210'
DATA11_2 DC X'8765'
DATA11_TEMP DC X'FEDC'
DATA12_1 DC X'FEDCBA9876543210'
DATA12_2 DC X'6543'
DATA12_TEMP DC X'FEDC'
DATA13_1 DC X'FEDCBA9876543210'
DATA13_2 DC X'76543210'
DATA14_1 DC X'FEDCBA9876543210'
DATA14_2 DC X'87654321'
DATA15_1 DC X'FEDCBA9876543210'
DATA15_2 DC X'6543210F'
DATA16_1 DC X'FEDCBA9876543210'
DATA16_2 DC X'76543210FEDCBA98'
DATA17_1 DC X'FEDCBA9876543210'
DATA17_2 DC X'876543210FEDCBA9'
DATA18_1 DC X'FEDCBA9876543210'
DATA18_2 DC X'6543210FEDCBA987'
DATA19_1 DC X'FEDCBA9876543210'
DATA19_2 DC X'FEDC'
DATA19_TEMP DC X'FEDC'
DATA20_1 DC X'FEDCBA9876543210'
DATA20_2 DC X'FFED'
DATA20_TEMP DC X'FEDC'
DATA21_1 DC X'FEDCBA9876543210'
DATA21_2 DC X'EDCB'
DATA21_TEMP DC X'FEDC'
DATA22_1 DC X'FEDCBA9876543210'
DATA22_2 DC X'FEDCBA98'
DATA23_1 DC X'FEDCBA9876543210'
DATA23_2 DC X'FFEDCBA9'
DATA24_1 DC X'FEDCBA9876543210'
DATA24_2 DC X'EDCBA987'
DATA25_1 DC X'FEDCBA9876543210'
DATA25_2 DC X'FEDCBA9876543210'
DATA26_1 DC X'FEDCBA9876543210'
DATA26_2 DC X'FFEDCBA987654321'
DATA27_1 DC X'FEDCBA9876543210'
DATA27_2 DC X'EDCBA9876543210F'
        END
