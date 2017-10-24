*************************************************
* FILENAME : X00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 169
*************************************************
                MACRO
                MACRO_X     &VALUE1,&VALUE2
                LG          2,&VALUE1
                OFADBGREG   2
                OFADBGMEM   &VALUE2,0
                X           2,&VALUE2
                OFADBGREG   2
                OFADBGMEM   &VALUE2,0
                MEND
X00             CSECT
                LR          12,15
                USING       X00,12
* binary	16bits	binary	32bits>	Zero
                MACRO_X     DATA1_1,DATA1_2
* binary	16bits	binary	32bits>	Not zero
                MACRO_X     DATA2_1,DATA2_2
* binary	16bits	binary	32bits	Zero
                MACRO_X     DATA3_1,DATA3_2
* binary	16bits	binary	32bits	Not zero
                MACRO_X     DATA4_1,DATA4_2
* binary	16bits	binary	32bits<	Zero
                MACRO_X     DATA5_1,DATA5_2
* binary	16bits	binary	32bits<	Not zero
                MACRO_X     DATA6_1,DATA6_2
* binary	32bits	binary	32bits>	Zero
                MACRO_X     DATA7_1,DATA7_2
* binary	32bits	binary	32bits>	Not zero
                MACRO_X     DATA8_1,DATA8_2
* binary	32bits	binary	32bits	Zero
                MACRO_X     DATA9_1,DATA9_2
* binary	32bits	binary	32bits	Not zero
                MACRO_X     DATA10_1,DATA10_2
* binary	32bits	binary	32bits<	Zero
                MACRO_X     DATA11_1,DATA11_2
* binary	32bits	binary	32bits<	Not zero
                MACRO_X     DATA12_1,DATA12_2
* binary	64bits	binary	32bits>	Zero
                MACRO_X     DATA13_1,DATA13_2
* binary	64bits	binary	32bits>	Not zero
                MACRO_X     DATA14_1,DATA14_2
* binary	64bits	binary	32bits	Zero
                MACRO_X     DATA15_1,DATA15_2
* binary	64bits	binary	32bits	Not zero
                MACRO_X     DATA16_1,DATA16_2
* binary	64bits	binary	32bits<	Zero
                MACRO_X     DATA17_1,DATA17_2
* binary	64bits	binary	32bits<	Not zero
                MACRO_X     DATA18_1,DATA18_2
                BR          14
                END
DATA1_1         DC          X'FFFFFFFFFFFF0000'
DATA1_2         DC          X'0000'
DATA1_TEMP      DC          X'FFFF'
DATA2_1         DC          X'000000000000FFFF'
DATA2_2         DC          X'0000'
DATA2_TEMP      DC          X'FFFF'
DATA3_1         DC          X'FFFFFFFFFFFF0000'
DATA3_2         DC          X'FFFF0000'
DATA4_1         DC          X'000000000000FFFF'
DATA4_2         DC          X'FFFF0000'
DATA5_1         DC          X'FFFFFFFFFFFF0000'
DATA5_2         DC          X'00000000FFFFFFFF'
DATA6_1         DC          X'FFFFFFFF00000000'
DATA6_2         DC          X'00000000FFFFFFFF'
DATA7_1         DC          X'FFFFFFFF00000000'
DATA7_2         DC          X'0000'
DATA7_TEMP      DC          X'FFFF'
DATA8_1         DC          X'FFFFFFFF00000000'
DATA8_2         DC          X'FFFF'
DATA8_TEMP      DC          X'0000'
DATA9_1         DC          X'FFFFFFFF00000000'
DATA9_2         DC          X'00000000'
DATA10_1        DC          X'FFFFFFFF00000000'
DATA10_2        DC          X'F0F0F0F0'
DATA11_1        DC          X'FFFFFFFF00000000'
DATA11_2        DC          X'00000000FFFFFFFF'
DATA12_1        DC          X'FFFFFFFF00000000'
DATA12_2        DC          X'FFFFFFFF00000000'
DATA13_1        DC          X'0000000000000000'
DATA13_2        DC          X'0000'
DATA13_TEMP     DC          X'FFFF'
DATA14_1        DC          X'0000000000000000'
DATA14_2        DC          X'0000'
DATA14_TEMP     DC          X'FFFF'
DATA15_1        DC          X'FFFFFFFF00000000'
DATA15_2        DC          X'00000000'
DATA16_1        DC          X'FFFFFFFF00000000'
DATA16_2        DC          X'0F0F0F0'
DATA17_1        DC          X'FFFFFFFF00000000'
DATA17_2        DC          X'00000000FFFFFFFF'
DATA18_1        DC          X'FFFFFFFF00000000'
DATA18_2        DC          X'FFFFFFFF00000000'

