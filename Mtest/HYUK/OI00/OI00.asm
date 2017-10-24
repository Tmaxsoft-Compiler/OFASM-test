*************************************************
* FILENAME : OI00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 169
*************************************************
                MACRO
                MACRO_OI    &VALUE1,&VALUE2
                LA          2,&VALUE2
                OFADBGMEM   &VALUE1,0
                OFADBGREG   2
                OI          &VALUE1,&VALUE2
                OFADBGMEM   &VALUE1,0
                OFADBGREG   2
                MEND
OI00            CSECT
                LR          12,15
                USING       OI00,12
* binary	1byte>	binary	1byte>	Zero
                MACRO_OI    DATA1_1,DATA1_2
* binary	1byte>	binary	1byte>	Not zero
                MACRO_OI    DATA2_1,DATA2_2
* binary	1byte>	binary	1byte	Zero
                MACRO_OI    DATA3_1,DATA3_2
* binary	1byte>	binary	1byte	Not zero
                MACRO_OI    DATA4_1,DATA4_2
* binary	1byte>	binary	1byte<	Zero
                MACRO_OI    DATA5_1,DATA5_2
* binary	1byte>	binary	1byte<	Not zero
                MACRO_OI    DATA6_1,DATA6_2
* binary	1byte	binary	1byte>	Zero
                MACRO_OI    DATA7_1,DATA7_2
* binary	1byte	binary	1byte>	Not zero
                MACRO_OI    DATA8_1,DATA8_2
* binary	1byte	binary	1byte	Zero
                MACRO_OI    DATA9_1,DATA9_2
* binary	1byte	binary	1byte	Not zero
                MACRO_OI    DATA10_1,DATA10_2
* binary	1byte	binary	1byte<	Zero
                MACRO_OI    DATA11_1,DATA11_2
* binary	1byte	binary	1byte<	Not zero
                MACRO_OI    DATA12_1,DATA12_2
* binary	1byte<	binary	1byte>	Zero
                MACRO_OI    DATA13_1,DATA13_2
* binary	1byte<	binary	1byte>	Not zero
                MACRO_OI    DATA14_1,DATA14_2
* binary	1byte<	binary	1byte	Zero
                MACRO_OI    DATA15_1,DATA15_2
* binary	1byte<	binary	1byte	Not zero
                MACRO_OI    DATA16_1,DATA16_2
* binary	1byte<	binary	1byte<	Zero
                MACRO_OI    DATA17_1,DATA17_2
* binary	1byte<	binary	1byte<	Not zero
                MACRO_OI    DATA18_1,DATA18_2
                BR          14
                END
DATA1_1         DC          B'0000'
DATA1_2         EQU         B'0000'
DATA2_1         DC          B'1010'
DATA2_2         EQU         B'0101'
DATA3_1         DC          B'0000'
DATA3_2         EQU         B'00000000'
DATA4_1         DC          B'0101'
DATA4_2         EQU         B'10101010'
DATA5_1         DC          B'0000'
DATA5_2         EQU         B'111100000000'
DATA6_1         DC          B'0000'
DATA6_2         EQU         B'111110000000'
DATA7_1         DC          B'00000000'
DATA7_2         EQU         B'0000'
DATA8_1         DC          B'01010101'
DATA8_2         EQU         B'1010'
DATA9_1         DC          B'00000000'
DATA9_2         EQU         B'00000000'
DATA10_1        DC          B'01010101'
DATA10_2        EQU         B'10101010'
DATA11_1        DC          B'00000000'
DATA11_2        EQU         B'111100000000'
DATA12_1        DC          B'01010101'
DATA12_2        EQU         B'000010101010'
DATA13_1        DC          B'000000001111'
DATA13_2        EQU         B'0000'
DATA14_1        DC          B'000000001010'
DATA14_2        EQU         B'0101'
DATA15_1        DC          B'000000001111'
DATA15_2        EQU         B'00000000'
DATA16_1        DC          B'101010100101'
DATA16_2        EQU         B'01010101'
DATA17_1        DC          B'000000000000'
DATA17_2        EQU         B'111100000000'
DATA18_1        DC          B'000000000000'
DATA18_2        EQU         B'1111111111110101010101010101101001011111'
