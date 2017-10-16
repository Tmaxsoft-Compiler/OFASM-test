                MACRO
                MACRO_O     &VALUE1,&VALUE2
                LG          2,&VALUE1
                OFADBGREG   2
                OFADBGMEM   &VALUE2,0
                O           2,&VALUE2
                OFADBGREG   2
                OFADBGMEM   &VALUE2,0
                MEND
O00             CSECT
                LR          12,15
                USING       O00,12
* binary	16bits	binary	32bits>	Zero
                MACRO_O     DATA1_1,DATA1_2
* binary	16bits	binary	32bits>	Not zero
                MACRO_O     DATA2_1,DATA2_2
* binary	16bits	binary	32bits	Zero
                MACRO_O     DATA3_1,DATA3_2
* binary	16bits	binary	32bits	Not zero
                MACRO_O     DATA4_1,DATA4_2
* binary	16bits	binary	32bits<	Zero
                MACRO_O     DATA5_1,DATA5_2
* binary	16bits	binary	32bits<	Not zero
                MACRO_O     DATA6_1,DATA6_2
* binary	32bits	binary	32bits>	Zero
                MACRO_O     DATA7_1,DATA7_2
* binary	32bits	binary	32bits>	Not zero
                MACRO_O     DATA8_1,DATA8_2
* binary	32bits	binary	32bits	Zero
                MACRO_O     DATA9_1,DATA9_2
* binary	32bits	binary	32bits	Not zero
                MACRO_O     DATA10_1,DATA10_2
* binary	32bits	binary	32bits<	Zero
                MACRO_O     DATA11_1,DATA11_2
* binary	32bits	binary	32bits<	Not zero
                MACRO_O     DATA12_1,DATA12_2
* binary	64bits	binary	32bits>	Zero
                MACRO_O     DATA13_1,DATA13_2
* binary	64bits	binary	32bits>	Not zero
                MACRO_O     DATA14_1,DATA14_2
* binary	64bits	binary	32bits	Zero
                MACRO_O     DATA15_1,DATA15_2
* binary	64bits	binary	32bits	Not zero
                MACRO_O     DATA16_1,DATA16_2
* binary	64bits	binary	32bits<	Zero
                MACRO_O     DATA17_1,DATA17_2
* binary	64bits	binary	32bits<	Not zero
                MACRO_O     DATA18_1,DATA18_2
                BR          14
                END
DATA1_1         DC          X'FFFFFFFFFFFF0000'
DATA1_2         DC          X'0000'
DATA1_TEMP      DC          X'FFFF'
DATA2_1         DC          X'0000000000008888'
DATA2_2         DC          X'4444'
DATA2_TEMP      DC          X'4444'
DATA3_1         DC          X'FFFFFFFFFFFF0000'
DATA3_2         DC          X'00000000'
DATA4_1         DC          X'0000000000001234'
DATA4_2         DC          X'12348888'
DATA5_1         DC          X'FFFFFFFFFFFF0000'
DATA5_2         DC          X'0000000000000000'
DATA6_1         DC          X'FFFFFFFF00000000'
DATA6_2         DC          X'0000000000001234'
DATA7_1         DC          X'FFFFFFFF00000000'
DATA7_2         DC          X'0000'
DATA7_TEMP      DC          X'FFFF'
DATA8_1         DC          X'FFFFFFFF00000000'
DATA8_2         DC          X'0000'
DATA8_TEMP      DC          X'0000'
DATA9_1         DC          X'FFFFFFFF00000000'
DATA9_2         DC          X'00000000'
DATA10_1        DC          X'FFFFFFFF00000000'
DATA10_2        DC          X'10000000'
DATA11_1        DC          X'FFFFFFFF00000000'
DATA11_2        DC          X'00000000FFFFFFFF'
DATA12_1        DC          X'FFFFFFFF00000000'
DATA12_2        DC          X'FFFFFFFF00000000'
DATA13_1        DC          X'0000000000000000'
DATA13_2        DC          X'0000'
DATA13_TEMP     DC          X'FFFF'
DATA14_1        DC          X'1000000000000000'
DATA14_2        DC          X'0000'
DATA14_TEMP     DC          X'FFFF'
DATA15_1        DC          X'FFFFFFFF00000000'
DATA15_2        DC          X'00000000'
DATA16_1        DC          X'FFFFFFFF00000000'
DATA16_2        DC          X'01234567'
DATA17_1        DC          X'FFFFFFFF00000000'
DATA17_2        DC          X'00000000FFFFFFFF'
DATA18_1        DC          X'FFFFFFFF00000000'
DATA18_2        DC          X'FFFFFFFF00000000'

