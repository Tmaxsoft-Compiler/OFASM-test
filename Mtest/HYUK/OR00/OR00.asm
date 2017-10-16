                MACRO
                MACRO_OR    &VALUE1,&VALUE2
                LG          2,&VALUE1
                LG          3,&VALUE2
                OFADBGREG   2
                OFADBGREG   3
                OR          2,3
                OFADBGREG   2
                OFADBGREG   3
                MEND
OR00            CSECT
                LR          12,15
                USING       OR00,12
* binary	16bits	binary	16bits Zero
                MACRO_OR    DATA1_1,DATA1_2
* binary	16bits	binary	16bits Not zero
                MACRO_OR    DATA2_1,DATA2_2
* binary	32bits	binary	32bits Zero
                MACRO_OR    DATA3_1,DATA3_2
* binary	32bits	binary	32bits Not zero
                MACRO_OR    DATA4_1,DATA4_2
* binary	64bits	binary	64bits Zero
                MACRO_OR    DATA5_1,DATA5_2
* binary	64bits	binary	64bits Not zero
                MACRO_OR    DATA6_1,DATA6_2
                BR          14
                END
DATA1_1         DC          X'FFFFFFFFFFFF0000'
DATA1_2         DC          X'FFFFFFFFFFFF0000'
DATA2_1         DC          X'0000000000001234'
DATA2_2         DC          X'FFFFFFFFFFFF5678'
DATA3_1         DC          X'FFFFFFFF00000000'
DATA3_2         DC          X'FFFFFFFF00000000'
DATA4_1         DC          X'FFFFFFFF00000000'
DATA4_2         DC          X'FFFFFFFF12345678'
DATA5_1         DC          X'0000000000000000'
DATA5_2         DC          X'0000000000000000'
DATA6_1         DC          X'1000000000000000'
DATA6_2         DC          X'0100000000000000'
