*************************************************
* FILENAME : DR01.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 169
*************************************************
                MACRO
                MACRO_DR    &VALUE1,&VALUE2,&REGNO
                LG          &REGNO,DATA_INIT_REG
                LG          &REGNO+1,DATA_INIT_REG
                L           &REGNO,&VALUE1
                L           &REGNO+1,&VALUE1+4
                LG          &REGNO+2,&VALUE2
                OFADBGREG   &REGNO
                OFADBGREG   &REGNO+1
                OFADBGREG   &REGNO+2
                DR          &REGNO,&REGNO+2
                OFADBGREG   &REGNO
                OFADBGREG   &REGNO+1
                OFADBGREG   &REGNO+2
                MEND
DR01            CSECT
                LR          12,15
                USING       DR01,12
* TESTCASE_1	0	16bits	0	16bits
*                MACRO_DR    DATA1_1,DATA1_2,2
* TESTCASE_4	0	16bits	0<	16bits
*                MACRO_DR    DATA2_1,DATA2_2,2
* TESTCASE_7	0	16bits	0>	16bits
*                MACRO_DR    DATA3_1,DATA3_2,2
* TESTCASE_11	0	32bits	0	32bits
                MACRO_DR    DATA4_1,DATA4_2,2
* TESTCASE_14	0	32bits	0<	32bits
*                MACRO_DR    DATA5_1,DATA5_2,2
* TESTCASE_17	0	32bits	0>	32bits
*                MACRO_DR    DATA6_1,DATA6_2,2
* TESTCASE_21	0	64bits	0	64bits
                MACRO_DR    DATA7_1,DATA7_2,2
* TESTCASE_24	0	64bits	0<	64bits
*                MACRO_DR    DATA8_1,DATA8_2,2
* TESTCASE_27	0	64bits	0>	64bits
                MACRO_DR    DATA9_1,DATA9_2,2
* TESTCASE_28	0<	16bits	0	16bits
*                MACRO_DR    DATA10_1,DATA10_2,2
* TESTCASE_31	0<	16bits	0<	16bits
*                MACRO_DR    DATA11_1,DATA11_2,2
* TESTCASE_34	0<	16bits	0>	16bits
*                MACRO_DR    DATA12_1,DATA12_2,2
* TESTCASE_38	0<	32bits	0	32bits
                MACRO_DR    DATA13_1,DATA13_2,2
* TESTCASE_41	0<	32bits	0<	32bits
*                MACRO_DR    DATA14_1,DATA14_2,2
* TESTCASE_44	0<	32bits	0>	32bits
*                MACRO_DR    DATA15_1,DATA15_2,2
* TESTCASE_48	0<	64bits	0	64bits
                MACRO_DR    DATA16_1,DATA16_2,2
* TESTCASE_51	0<	64bits	0<	64bits
*                MACRO_DR    DATA17_1,DATA17_2,2
* TESTCASE_54	0<	64bits	0>	64bits
                MACRO_DR    DATA18_1,DATA18_2,2
* TESTCASE_55	0>	16bits	0	16bits
*                MACRO_DR    DATA19_1,DATA19_2,2
* TESTCASE_58	0>	16bits	0<	16bits
*                MACRO_DR    DATA20_1,DATA20_2,2
* TESTCASE_61	0>	16bits	0>	16bits
*                MACRO_DR    DATA21_1,DATA21_2,2
* TESTCASE_65	0>	32bits	0	32bits
                MACRO_DR    DATA22_1,DATA22_2,2
* TESTCASE_68	0>	32bits	0<	32bits
*                MACRO_DR    DATA23_1,DATA23_2,2
* TESTCASE_71	0>	32bits	0>	32bits
*                MACRO_DR    DATA24_1,DATA24_2,2
* TESTCASE_75	0>	64bits	0	64bits
                MACRO_DR    DATA25_1,DATA25_2,2
* TESTCASE_78	0>	64bits	0<	64bits
*                MACRO_DR    DATA26_1,DATA26_2,2
* TESTCASE_81	0>	64bits	0>	64bits
                MACRO_DR    DATA27_1,DATA27_2,2
                BR          14
DATA_INIT_REG DC X'0416041600000000'
DATA1_1 DC X'0416041604160000'
DATA1_2 DC X'0416041604160000'
DATA2_1 DC X'0416041604160000'
DATA2_2 DC X'0416041604161234'
DATA3_1 DC X'0416041604160000'
DATA3_2 DC X'0416041604168000'
DATA4_1 DC X'0416041600000000'
DATA4_2 DC X'0416041600000000'
DATA5_1 DC X'0416041600000000'
DATA5_2 DC X'0416041612345678'
DATA6_1 DC X'0416041600000000'
DATA6_2 DC X'0416041680000000'
DATA7_1 DC X'0000000000000000'
DATA7_2 DC X'0000000000000000'
DATA8_1 DC X'0000000000000000'
DATA8_2 DC X'123456789ABCDEF0'
DATA9_1 DC X'0000000000000000'
DATA9_2 DC X'8000000000000000'
DATA10_1 DC X'0416041604161234'
DATA10_2 DC X'0416041604160000'
DATA11_1 DC X'0416041604161234'
DATA11_2 DC X'0416041604161234'
DATA12_1 DC X'0416041604161234'
DATA12_2 DC X'0416041604168000'
DATA13_1 DC X'0416041612345678'
DATA13_2 DC X'0416041600000000'
DATA14_1 DC X'0416041612345678'
DATA14_2 DC X'0416041612345678'
DATA15_1 DC X'0416041612345678'
DATA15_2 DC X'0416041680000000'
DATA16_1 DC X'123456789ABCDEF0'
DATA16_2 DC X'0000000000000000'
DATA17_1 DC X'123456789ABCDEF0'
DATA17_2 DC X'123456789ABCDEF0'
DATA18_1 DC X'123456789ABCDEF0'
DATA18_2 DC X'8000000000000000'
DATA19_1 DC X'041604160416F123'
DATA19_2 DC X'0416041604160000'
DATA20_1 DC X'041604160416F123'
DATA20_2 DC X'0416041604161234'
DATA21_1 DC X'041604160416F123'
DATA21_2 DC X'0416041604168000'
DATA22_1 DC X'04160416F1234567'
DATA22_2 DC X'0416041600000000'
DATA23_1 DC X'04160416F1234567'
DATA23_2 DC X'0416041612345678'
DATA24_1 DC X'04160416F1234567'
DATA24_2 DC X'0416041680000000'
DATA25_1 DC X'F123456789ABCDEF'
DATA25_2 DC X'0000000000000000'
DATA26_1 DC X'F123456789ABCDEF'
DATA26_2 DC X'123456789ABCDEF0'
DATA27_1 DC X'F123456789ABCDEF'
DATA27_2 DC X'8000000000000000'
                END
