*************************************************
* FILENAME : PACK00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 169
*************************************************
                MACRO
                MAC_PACK    &VALUE1,&VALUE2
                OFADBGMEM   &VALUE1,0
                OFADBGMEM   &VALUE2,0
                PACK        &VALUE1,&VALUE2
                OFADBGMEM   &VALUE1,0
                OFADBGMEM   &VALUE2,0
                MEND
PACK00          CSECT
                LR          12,15
                USING       PACK00,12
* valid length(1~16)	0	valid length(1~16)	0	invalid length diff
                MAC_PACK    DATA1_1,DATA1_2
* valid length(1~16)	0	valid length(1~16)	0	valid length diff
                MAC_PACK    DATA2_1,DATA2_2
* valid length(1~16)	0	valid length(1~16)	0<	invalid length diff
                MAC_PACK    DATA3_1,DATA3_2
* valid length(1~16)	0	valid length(1~16)	0<	valid length diff
                MAC_PACK    DATA4_1,DATA4_2
* valid length(1~16)	0	valid length(1~16)	0>	invalid length diff
                MAC_PACK    DATA5_1,DATA5_2
* valid length(1~16)	0	valid length(1~16)	0>	valid length diff
                MAC_PACK    DATA6_1,DATA6_2
* valid length(1~16)	0<	valid length(1~16)	0	invalid length diff
                MAC_PACK    DATA7_1,DATA7_2
* valid length(1~16)	0<	valid length(1~16)	0	valid length diff
                MAC_PACK    DATA8_1,DATA8_2
* valid length(1~16)	0<	valid length(1~16)	0<	invalid length diff
                MAC_PACK    DATA9_1,DATA9_2
* valid length(1~16)	0<	valid length(1~16)	0<	valid length diff
                MAC_PACK    DATA10_1,DATA10_2
* valid length(1~16)	0<	valid length(1~16)	0>	invalid length diff
                MAC_PACK    DATA11_1,DATA11_2
* valid length(1~16)	0<	valid length(1~16)	0>	valid length diff
                MAC_PACK    DATA12_1,DATA12_2
* valid length(1~16)	0>	valid length(1~16)	0	invalid length diff
                MAC_PACK    DATA13_1,DATA13_2
* valid length(1~16)	0>	valid length(1~16)	0	valid length diff
                MAC_PACK    DATA14_1,DATA14_2
* valid length(1~16)	0>	valid length(1~16)	0<	invalid length diff
                MAC_PACK    DATA15_1,DATA15_2
* valid length(1~16)	0>	valid length(1~16)	0<	valid length diff
                MAC_PACK    DATA16_1,DATA16_2
* valid length(1~16)	0>	valid length(1~16)	0>	invalid length diff
                MAC_PACK    DATA17_1,DATA17_2
* valid length(1~16)	0>	valid length(1~16)	0>	valid length diff
                MAC_PACK    DATA18_1,DATA18_2
                BR          14
                END
DATA1_1         DC          PL1'0'
DATA1_2         DC          ZL4'0'
DATA2_1         DC          PL2'0'
DATA2_2         DC          ZL1'0'
DATA3_1         DC          PL5'0'
DATA3_2         DC          ZL10'1234567890'
DATA4_1         DC          PL6'0'
DATA4_2         DC          ZL10'1234567890'
DATA5_1         DC          PL5'0'
DATA5_2         DC          ZL10'-1234567890'
DATA6_1         DC          PL6'0'
DATA6_2         DC          ZL10'-1234567890'
DATA7_1         DC          PL6'1234567890'
DATA7_2         DC          ZL12'0'
DATA8_1         DC          PL6'1234567890'
DATA8_2         DC          ZL10'0'
DATA9_1         DC          PL5'1234567890'
DATA9_2         DC          ZL10'1234567890'
DATA10_1        DC          PL6'1234567890'
DATA10_2        DC          ZL10'1234567890'
DATA11_1        DC          PL5'1234567890'
DATA11_2        DC          ZL10'-1234567890'
DATA12_1        DC          PL6'1234567890'
DATA12_2        DC          ZL10'-1234567890'
DATA13_1        DC          PL6'-1234567890'
DATA13_2        DC          ZL12'0'
DATA14_1        DC          PL6'-1234567890'
DATA14_2        DC          ZL1'0'
DATA15_1        DC          PL5'-1234567890'
DATA15_2        DC          ZL10'1234567890'
DATA16_1        DC          PL6'-1234567890'
DATA16_2        DC          ZL10'1234567890'
DATA17_1        DC          PL5'-1234567890'
DATA17_2        DC          ZL10'-1234567890'
DATA18_1        DC          PL7'-1234567890'
DATA18_2        DC          ZL10'-1234567890'
