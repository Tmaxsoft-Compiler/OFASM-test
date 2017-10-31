*************************************************
* FILENAME : XC00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 169
*************************************************
                MACRO
                MACRO_XC    &VALUE1,&VALUE2
                LA          2,0
                OFADBGMEM   &VALUE1,0
                OFADBGMEM   &VALUE2,0
                XC          &VALUE1,&VALUE2
                OFADBGMEM   &VALUE1,0
                OFADBGMEM   &VALUE2,0
                OFADBGREG   2
                MEND
XC00            CSECT
                LR          12,15
                USING       XC00,12
* valid length	binary	binary	op1 length equal op2 length	Zero
                MACRO_XC    DATA1_1,DATA1_2
* valid length	binary	binary	op1 length=op2 length	Not zero
                MACRO_XC    DATA2_1,DATA2_2
* valid length	binary	binary	op1 length>op2 length	longer op	Zero
                MACRO_XC    DATA3_1,DATA3_2
* valid length	binary	binary	op1 length>op2 length	longer op	Not zero
                MACRO_XC    DATA4_1,DATA4_2
* valid length	binary	binary	op1 length>op2 length	shorter op	Zero
                MACRO_XC    DATA5_1,DATA5_2
* valid length	binary	binary	op1 length>op2 length	shorter op	Not zero
                MACRO_XC    DATA6_1,DATA6_2
* valid length	binary	binary	op1 length<op2 length	longer op	Zero
                MACRO_XC    DATA7_1,DATA7_2
* valid length	binary	binary	op1 length<op2 length	longer op	Not zero
                MACRO_XC    DATA8_1,DATA8_2
* valid length	binary	binary	op1 length<op2 length	shorter op	Zero
                MACRO_XC    DATA9_1,DATA9_2
* valid length	binary	binary	op1 length<op2 length	shorter op	Not zero
                MACRO_XC    DATA10_1,DATA10_2
                BR          14
                END
DATA1_1         DC          X'0000000000000000'
DATA1_2         DC          X'0000000000000000'
DATA2_1         DC          X'0F0F0F0F0F0F0F0F'
DATA2_2         DC          X'F0F0F0F0F0F0F0F0'
DATA3_1         DC          X'00000000000000000000'
DATA3_2         DC          X'0000000000000000'
DATA3_TEMP      DC          X'FFFF'
DATA4_1         DC          X'00000000000000000000'
DATA4_2         DC          X'0F0F0F0F0F0F0F0F'
DATA4_TEMP      DC          X'0000'
DATA5_1         DC          X'0000000000000000FFFF'
DATA5_2         DC          X'0000000000000000'
DATA5_TEMP      DC          X'0000'
DATA6_1         DC          X'0000000000000000FFFF'
DATA6_2         DC          X'0F0F0F0F0F0F0F0F'
DATA6_TEMP      DC          X'0000'
DATA7_1         DC          X'000000000000'
DATA7_TEMP      DC          X'FFFF'
DATA7_2         DC          X'0000000000000000'
DATA8_1         DC          X'000000000000'
DATA8_TEMP      DC          X'0000'
DATA8_2         DC          X'000000000000FFFF'
DATA9_1         DC          X'000000000000'
DATA9_TEMP      DC          X'0000'
DATA9_2         DC          X'000000000000FFFF'
DATA10_1        DC          X'0F0F0F0F0F0F'
DATA10_TEMP     DC          X'0000'
DATA10_2        DC          X'F0F0F0F0F0F0FFFF'
