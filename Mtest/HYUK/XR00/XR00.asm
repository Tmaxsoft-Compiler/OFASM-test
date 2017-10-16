                MACRO
                MACRO_XR    &VALUE1,&VALUE2
                LG          2,&VALUE1
                LG          3,&VALUE2
                OFADBGREG   2
                OFADBGREG   3
                XR          2,3
                OFADBGREG   2
                OFADBGREG   3
                MEND
XR00            CSECT
                LR          12,15
                USING       XR00,12
* binary	16bits	binary	16bits Zero
                MACRO_XR    DATA1_1,DATA1_2
* binary	16bits	binary	16bits Not zero
                MACRO_XR    DATA2_1,DATA2_2
* binary	32bits	binary	32bits Zero
                MACRO_XR    DATA3_1,DATA3_2
* binary	32bits	binary	32bits Not zero
                MACRO_XR    DATA4_1,DATA4_2
* binary	64bits	binary	64bits Zero
                MACRO_XR    DATA5_1,DATA5_2
* binary	64bits	binary	64bits Not zero
                MACRO_XR    DATA6_1,DATA6_2
                BR          14
                END
DATA1_1         DC          X'FFFFFFFFFFFF0000'
DATA1_2         DC          X'FFFFFFFFFFFF0000'
DATA2_1         DC          X'000000000000FFFF'
DATA2_2         DC          X'FFFFFFFFFFFF0000'
DATA3_1         DC          X'FFFFFFFF88888888'
DATA3_2         DC          X'FFFFFFFF88888888'
DATA4_1         DC          X'FFFFFFFF00000000'
DATA4_2         DC          X'FFFFFFFF88888888'
DATA5_1         DC          X'0F0F0F0FF0F0F0F0'
DATA5_2         DC          X'0F0F0F0FF0F0F0F0'
DATA6_1         DC          X'0F0F0F0F00000000'
DATA6_2         DC          X'F0F0F0F000000000'
