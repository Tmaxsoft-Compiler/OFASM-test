*************************************************
* FILENAME : N00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 169
*************************************************
                MACRO
                MACRO_N     &VALUE1,&VALUE2
                LG          2,&VALUE1
                OFADBGREG   2
                OFADBGMEM   &VALUE2,0
                N           2,&VALUE2
                OFADBGREG   2
                OFADBGMEM   &VALUE2,0
                MEND
N00             CSECT
                LR          12,15
                USING       N00,12
* binary	16bits	binary	32bits>	Zero
                MACRO_N     DATA1_1,DATA1_2
* binary	16bits	binary	32bits>	Not zero
                MACRO_N     DATA2_1,DATA2_2
* binary	16bits	binary	32bits	Zero
                MACRO_N     DATA3_1,DATA3_2
* binary	16bits	binary	32bits	Not zero
                MACRO_N     DATA4_1,DATA4_2
* binary	16bits	binary	32bits<	Zero
                MACRO_N     DATA5_1,DATA5_2
* binary	16bits	binary	32bits<	Not zero
                MACRO_N     DATA6_1,DATA6_2
* binary	32bits	binary	32bits>	Zero
                MACRO_N     DATA7_1,DATA7_2
* binary	32bits	binary	32bits>	Not zero
                MACRO_N     DATA8_1,DATA8_2
* binary	32bits	binary	32bits	Zero
                MACRO_N     DATA9_1,DATA9_2
* binary	32bits	binary	32bits	Not zero
                MACRO_N     DATA10_1,DATA10_2
* binary	32bits	binary	32bits<	Zero
                MACRO_N     DATA11_1,DATA11_2
* binary	32bits	binary	32bits<	Not zero
                MACRO_N     DATA12_1,DATA12_2
* binary	64bits	binary	32bits>	Zero
                MACRO_N     DATA13_1,DATA13_2
* binary	64bits	binary	32bits>	Not zero
                MACRO_N     DATA14_1,DATA14_2
* binary	64bits	binary	32bits	Zero
                MACRO_N     DATA15_1,DATA15_2
* binary	64bits	binary	32bits	Not zero
                MACRO_N     DATA16_1,DATA16_2
* binary	64bits	binary	32bits<	Zero
                MACRO_N     DATA17_1,DATA17_2
* binary	64bits	binary	32bits<	Not zero
                MACRO_N     DATA18_1,DATA18_2
                BR          14
DATA1_1         DC          X'FFFFFFFFFFFF0123'
DATA1_2         DC          X'0000'
DATA1_TEMP      DC          X'FFFF'
DATA2_1         DC          X'FFFFFFFFFFFF0123'
DATA2_2         DC          X'FFFF'
DATA2_TEMP      DC          X'0000'
DATA3_1         DC          X'FFFFFFFFFFFF0123'
DATA3_2         DC          X'00000000'
DATA4_1         DC          X'FFFFFFFFFFFF0123'
DATA4_2         DC          X'00000001'
DATA5_1         DC          X'FFFFFFFFFFFF0123'
DATA5_2         DC          X'0000000000000000'
DATA6_1         DC          X'FFFFFFFF01234567'
DATA6_2         DC          X'0123456789ABCDEF'
DATA7_1         DC          X'FFFFFFFF01234567'
DATA7_2         DC          X'0000'
DATA7_TEMP      DC          X'FFFF'
DATA8_1         DC          X'FFFFFFFF01234567'
DATA8_2         DC          X'FEDC'
DATA8_TEMP      DC          X'0000'
DATA9_1         DC          X'FFFFFFFF01234567'
DATA9_2         DC          X'00000000'
DATA10_1        DC          X'FFFFFFFF01234567'
DATA10_2        DC          X'01234567'
DATA11_1        DC          X'FFFFFFFF01234567'
DATA11_2        DC          X'00000000FFFFFFFF'
DATA12_1        DC          X'FFFFFFFF01234567'
DATA12_2        DC          X'FFFFFFFF00000000'
DATA13_1        DC          X'0123456789ABCDEF'
DATA13_2        DC          X'0000'
DATA13_TEMP     DC          X'FFFF'
DATA14_1        DC          X'0123456789ABCDEF'
DATA14_2        DC          X'FFFF'
DATA14_TEMP     DC          X'0000'
DATA15_1        DC          X'0123456789ABCDEF'
DATA15_2        DC          X'00000000'
DATA16_1        DC          X'0123456789ABCDEF'
DATA16_2        DC          X'01234567'
DATA17_1        DC          X'0123456789ABCDEF'
DATA17_2        DC          X'00000000FFFFFFFF'
DATA18_1        DC          X'0123456789ABCDEF'
DATA18_2        DC          X'FFFFFFFF00000000'
                END
