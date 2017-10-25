*************************************************
* FILENAME : CLC00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 169
*************************************************
                MACRO
                MACRO_CLC   &VALUE1,&VALUE2
                LA          2,0
                OFADBGMEM   &VALUE1,0
                OFADBGMEM   &VALUE2,0
                CLC         &VALUE1,&VALUE2
                OFADBGMEM   &VALUE1,0
                OFADBGMEM   &VALUE2,0
                OFADBGREG   2
                MEND
CLC00           CSECT
                LR          12,15
                USING       CLC00,12
* valid length(1~256) op1 length=op2 length oprand1=oprand2
                MACRO_CLC   DATA1_1,DATA1_2
* valid length(1~256) op1 length=op2 length oprand1<oprand2
                MACRO_CLC   DATA2_1,DATA2_2
* valid length(1~256) op1 length=op2 length oprand1>oprand2
                MACRO_CLC   DATA3_1,DATA3_2
* valid length(1~256) op1 length>op2 length longer op oprand1=oprand2
                MACRO_CLC   DATA4_1,DATA4_2
* valid length(1~256) op1 length>op2 length longer op oprand1<oprand2
                MACRO_CLC   DATA5_1,DATA5_2
* valid length(1~256) op1 length>op2 length longer op oprand1>oprand2
                MACRO_CLC   DATA6_1,DATA6_2
* valid length(1~256) op1 length>op2 length shorter op oprand1=oprand2
                MACRO_CLC   DATA7_1,DATA7_2
* valid length(1~256) op1 length>op2 length shorter op oprand1<oprand2
                MACRO_CLC   DATA8_1,DATA8_2
* valid length(1~256) op1 length>op2 length shorter op oprand1>oprand2
                MACRO_CLC   DATA9_1,DATA9_2
* valid length(1~256) op1 length<op2 length longer op oprand1=oprand2
                MACRO_CLC   DATA10_1,DATA10_2
* valid length(1~256) op1 length<op2 length longer op oprand1<oprand2
                MACRO_CLC   DATA11_1,DATA11_2
* valid length(1~256) op1 length<op2 length longer op oprand1>oprand2
                MACRO_CLC   DATA12_1,DATA12_2
* valid length(1~256) op1 length<op2 length shorter op oprand1=oprand2
                MACRO_CLC   DATA13_1,DATA13_2
* valid length(1~256) op1 length<op2 length shorter op oprand1<oprand2
                MACRO_CLC   DATA14_1,DATA14_2
* valid length(1~256) op1 length<op2 length shorter op oprand1>oprand2
                MACRO_CLC   DATA15_1,DATA15_2
                BR          14
DATA1_1         DC          X'0123456789ABCDEF'
DATA1_2         DC          X'0123456789ABCDEF'
DATA2_1         DC          X'0123456789ABCDEF'
DATA2_2         DC          X'FEDCBA9876543210'
DATA3_1         DC          X'FEDCBA9876543210'
DATA3_2         DC          X'0123456789ABCDEF'
DATA4_1         DC          X'0123456789ABCDEF0123'
DATA4_2         DC          X'0123456789ABCDEF'
DATA4_TEMP      DC          X'0123'
DATA5_1         DC          X'0123456789ABCDEF0123'
DATA5_2         DC          X'0123456789ABCDEF'
DATA5_TEMP      DC          X'FEDC'
DATA6_1         DC          X'0123456789ABCDEF0123'
DATA6_2         DC          X'0123456789ABCDEF'
DATA6_TEMP      DC          X'0000'
DATA7_1         DC          X'0123456789ABCDEF0123'
DATA7_2         DC          X'0123456789ABCDEF'
DATA7_TEMP      DC          X'FEDC'
DATA8_1         DC          X'0123456789ABCDEF0123'
DATA8_2         DC          X'FEDCBA9876543210'
DATA8_TEMP      DC          X'0123'
DATA9_1         DC          X'FEDCBA9876543210FEDC'
DATA9_2         DC          X'0123456789ABCDEF'
DATA9_TEMP      DC          X'0123'
DATA10_1        DC          X'0123456789ABCDEF'
DATA10_TEMP     DC          X'0123'
DATA10_2        DC          X'0123456789ABCDEF0123'
DATA11_1        DC          X'0123456789ABCDEF'
DATA11_TEMP     DC          X'0000'
DATA11_2        DC          X'0123456789ABCDEF0123'
DATA12_1        DC          X'0123456789ABCDEF'
DATA12_TEMP     DC          X'FEDC'
DATA12_2        DC          X'0123456789ABCDEF0123'
DATA13_1        DC          X'0123456789ABCDEF'
DATA13_TEMP     DC          X'FEDC'
DATA13_2        DC          X'0123456789ABCDEF0123'
DATA14_1        DC          X'0123456789ABCDEF'
DATA14_TEMP     DC          X'0123'
DATA14_2        DC          X'FEDCBA9876543210FEDC'
DATA15_1        DC          X'FEDCBA9876543210'
DATA15_TEMP     DC          X'0000'
DATA15_2        DC          X'0123456789ABCDEF0123'
                END
