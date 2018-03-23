*************************************************
* FILENAME : NR00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 169
*************************************************
                MACRO
                MACRO_NR    &VALUE1,&VALUE2
                LG          2,&VALUE1
                LG          3,&VALUE2
                OFADBGREG   2
                OFADBGREG   3
                NR          2,3
                OFADBGREG   2
                OFADBGREG   3
                MEND
NR00            CSECT
                LR          12,15
                USING       NR00,12
* TESTCASE_1	binary	16bits	binary	16bits	Zero
                MACRO_NR    DATA1_1,DATA1_2
* TESTCASE_2	binary	16bits	binary	16bits	Not zero
                MACRO_NR    DATA2_1,DATA2_2
* TESTCASE_9	binary	32bits	binary	32bits	Zero
                MACRO_NR    DATA3_1,DATA3_2
* TESTCASE_10	binary	32bits	binary	32bits	Not zero
                MACRO_NR    DATA4_1,DATA4_2
* TESTCASE_17	binary	64bits	binary	64bits	Zero
                MACRO_NR    DATA5_1,DATA5_2
* TESTCASE_18	binary	64bits	binary	64bits	Not zero
                MACRO_NR    DATA6_1,DATA6_2
        BR          14
DATA1_1 DC X'FFFFFFFFFFFF0F0F'
DATA1_2 DC X'FFFFFFFFFFFFF0F0'
DATA2_1 DC X'FFFFFFFFFFFF0F0F'
DATA2_2 DC X'FFFFFFFFFFFF0F0F'
DATA3_1 DC X'FFFFFFFF0F0F0F0F'
DATA3_2 DC X'FFFFFFFFF0F0F0F0'
DATA4_1 DC X'FFFFFFFF0F0F0F0F'
DATA4_2 DC X'FFFFFFFF0F0F0F0F'
DATA5_1 DC X'0F0F0F0F0F0F0F0F'
DATA5_2 DC X'F0F0F0F0F0F0F0F0'
DATA6_1 DC X'0F0F0F0F0F0F0F0F'
DATA6_2 DC X'0F0F0F0F0F0F0F0F'
        END
