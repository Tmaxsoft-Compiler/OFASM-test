*************************************************
* FILENAME : CLM00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 169
*************************************************
                MACRO
                MACRO_CLM   &VALUE1,&VALUE2,&MASK
                LA          3,&MASK
                LG          2,&VALUE1
                OFADBGREG   3
                OFADBGREG   2
                OFADBGMEM   &VALUE2,0
                CLM         2,&MASK,&VALUE2
                OFADBGREG   2
                OFADBGMEM   &VALUE2,0
                MEND
CLM00           CSECT
                LR          12,15
                USING       CLM00,12
* unsigned 16bits unsigned 1byte 0 mask bits all zeros
                MACRO_CLM   DATA1_1,DATA1_2,0
* unsigned 16bits unsigned 1byte 1,2,4,8 oprand1=oprand2
                MACRO_CLM   DATA2_1,DATA2_2,1
* unsigned 16bits unsigned 1byte 1,2,4,8 oprand1<oprand2
                MACRO_CLM   DATA3_1,DATA3_2,1
* unsigned 16bits unsigned 1byte 1,2,4,8 oprand1>oprand2
                MACRO_CLM   DATA4_1,DATA4_2,1
* unsigned 16bits unsigned 2bytes 0 mask bits all zeros
                MACRO_CLM   DATA5_1,DATA5_2,0
* unsigned 16bits unsigned 2bytes 3,5,6,9,10,12 oprand1=oprand2
                MACRO_CLM   DATA6_1,DATA6_2,3
* unsigned 16bits unsigned 2bytes 3,5,6,9,10,12 oprand1<oprand2
                MACRO_CLM   DATA7_1,DATA7_2,3
* unsigned 16bits unsigned 2bytes 3,5,6,9,10,12 oprand1>oprand2
                MACRO_CLM   DATA8_1,DATA8_2,3
* unsigned 16bits unsigned 3bytes 0 mask bits all zeros
                MACRO_CLM   DATA9_1,DATA9_2,0
* unsigned 16bits unsigned 3bytes 7,11,13,14 oprand1=oprand2
                MACRO_CLM   DATA10_1,DATA10_2,7
* unsigned 16bits unsigned 3bytes 7,11,13,14 oprand1<oprand2
                MACRO_CLM   DATA11_1,DATA11_2,7
* unsigned 16bits unsigned 3bytes 7,11,13,14 oprand1>oprand2
                MACRO_CLM   DATA12_1,DATA12_2,7
* unsigned 16bits unsigned 4bytes 0 mask bits all zeros
                MACRO_CLM   DATA13_1,DATA13_2,0
* unsigned 16bits unsigned 4bytes 15 oprand1=oprand2
                MACRO_CLM   DATA14_1,DATA14_2,15
* unsigned 16bits unsigned 4bytes 15 oprand1<oprand2
                MACRO_CLM   DATA15_1,DATA15_2,15
* unsigned 16bits unsigned 4bytes 15 oprand1>oprand2
                MACRO_CLM   DATA16_1,DATA16_2,15
* unsigned 16bits unsigned 4bytes< 0 mask bits all zeros
                MACRO_CLM   DATA17_1,DATA17_2,0
* unsigned 16bits unsigned 4bytes< 1,2,4,8 oprand1=oprand2
                MACRO_CLM   DATA18_1,DATA18_2,1
* unsigned 16bits unsigned 4bytes< 1,2,4,8 oprand1<oprand2
                MACRO_CLM   DATA19_1,DATA19_2,1
* unsigned 16bits unsigned 4bytes< 1,2,4,8 oprand1>oprand2
                MACRO_CLM   DATA20_1,DATA20_2,1
* unsigned 16bits unsigned 4bytes< 3,5,6,9,10,12 oprand1=oprand2
                MACRO_CLM   DATA21_1,DATA21_2,3
* unsigned 16bits unsigned 4bytes< 3,5,6,9,10,12 oprand1<oprand2
                MACRO_CLM   DATA22_1,DATA22_2,3
* unsigned 16bits unsigned 4bytes< 3,5,6,9,10,12 oprand1>oprand2
                MACRO_CLM   DATA23_1,DATA23_2,3
* unsigned 16bits unsigned 4bytes< 7,11,13,14 oprand1=oprand2
                MACRO_CLM   DATA24_1,DATA24_2,7
* unsigned 16bits unsigned 4bytes< 7,11,13,14 oprand1<oprand2
                MACRO_CLM   DATA25_1,DATA25_2,7
* unsigned 16bits unsigned 4bytes< 7,11,13,14 oprand1>oprand2
                MACRO_CLM   DATA26_1,DATA26_2,7
* unsigned 16bits unsigned 4bytes< 15 oprand1=oprand2
                MACRO_CLM   DATA27_1,DATA27_2,15
* unsigned 16bits unsigned 4bytes< 15 oprand1<oprand2
                MACRO_CLM   DATA28_1,DATA28_2,15
* unsigned 16bits unsigned 4bytes< 15 oprand1>oprand2
                MACRO_CLM   DATA29_1,DATA29_2,15
* unsigned 32bits unsigned 1byte 0 mask bits all zeros
                MACRO_CLM   DATA30_1,DATA30_2,0
* unsigned 32bits unsigned 1byte 1,2,4,8 oprand1=oprand2
                MACRO_CLM   DATA31_1,DATA31_2,1
* unsigned 32bits unsigned 1byte 1,2,4,8 oprand1<oprand2
                MACRO_CLM   DATA32_1,DATA32_2,1
* unsigned 32bits unsigned 1byte 1,2,4,8 oprand1>oprand2
                MACRO_CLM   DATA33_1,DATA33_2,1
* unsigned 32bits unsigned 2bytes 0 mask bits all zeros
                MACRO_CLM   DATA34_1,DATA34_2,0
* unsigned 32bits unsigned 2bytes 3,5,6,9,10,12 oprand1=oprand2
                MACRO_CLM   DATA35_1,DATA35_2,3
* unsigned 32bits unsigned 2bytes 3,5,6,9,10,12 oprand1<oprand2
                MACRO_CLM   DATA36_1,DATA36_2,3
* unsigned 32bits unsigned 2bytes 3,5,6,9,10,12 oprand1>oprand2
                MACRO_CLM   DATA37_1,DATA37_2,3
* unsigned 32bits unsigned 3bytes 0 mask bits all zeros
                MACRO_CLM   DATA38_1,DATA38_2,0
* unsigned 32bits unsigned 3bytes 7,11,13,14 oprand1=oprand2
                MACRO_CLM   DATA39_1,DATA39_2,7
* unsigned 32bits unsigned 3bytes 7,11,13,14 oprand1<oprand2
                MACRO_CLM   DATA40_1,DATA40_2,7
* unsigned 32bits unsigned 3bytes 7,11,13,14 oprand1>oprand2
                MACRO_CLM   DATA41_1,DATA41_2,7
* unsigned 32bits unsigned 4bytes 0 mask bits all zeros
                MACRO_CLM   DATA42_1,DATA42_2,0
* unsigned 32bits unsigned 4bytes 15 oprand1=oprand2
                MACRO_CLM   DATA43_1,DATA43_2,15
* unsigned 32bits unsigned 4bytes 15 oprand1<oprand2
                MACRO_CLM   DATA44_1,DATA44_2,15
* unsigned 32bits unsigned 4bytes 15 oprand1>oprand2
                MACRO_CLM   DATA45_1,DATA45_2,15
* unsigned 32bits unsigned 4bytes< 0 mask bits all zeros
                MACRO_CLM   DATA46_1,DATA46_2,0
* unsigned 32bits unsigned 4bytes< 1,2,4,8 oprand1=oprand2
                MACRO_CLM   DATA47_1,DATA47_2,1
* unsigned 32bits unsigned 4bytes< 1,2,4,8 oprand1<oprand2
                MACRO_CLM   DATA48_1,DATA48_2,1
* unsigned 32bits unsigned 4bytes< 1,2,4,8 oprand1>oprand2
                MACRO_CLM   DATA49_1,DATA49_2,1
* unsigned 32bits unsigned 4bytes< 3,5,6,9,10,12 oprand1=oprand2
                MACRO_CLM   DATA50_1,DATA50_2,3
                BR          14
DATA1_1 DC X'FFFFFFFFFFFF0000'
DATA1_2 DC X'01'
DATA1_TEMP DC X'234567'
DATA2_1 DC X'FFFFFFFFFFFF0001'
DATA2_2 DC X'01'
DATA2_TEMP DC X'234567'
DATA3_1 DC X'FFFFFFFFFFFF0000'
DATA3_2 DC X'01'
DATA3_TEMP DC X'234567'
DATA4_1 DC X'FFFFFFFFFFFF0002'
DATA4_2 DC X'01'
DATA4_TEMP DC X'234567'
DATA5_1 DC X'FFFFFFFFFFFF0000'
DATA5_2 DC X'0123'
DATA5_TEMP DC X'4567'
DATA6_1 DC X'FFFFFFFFFFFF0123'
DATA6_2 DC X'0123'
DATA6_TEMP DC X'4567'
DATA7_1 DC X'FFFFFFFFFFFF0012'
DATA7_2 DC X'0123'
DATA7_TEMP DC X'4567'
DATA8_1 DC X'FFFFFFFFFFFF1234'
DATA8_2 DC X'0123'
DATA8_TEMP DC X'4567'
DATA9_1 DC X'FFFFFFFFFFFF0000'
DATA9_2 DC X'012345'
DATA9_TEMP DC X'67'
DATA10_1 DC X'FFFFFFFFFFFF0123'
DATA10_2 DC X'012345'
DATA10_TEMP DC X'67'
DATA11_1 DC X'FFFFFFFFFFFF0012'
DATA11_2 DC X'012345'
DATA11_TEMP DC X'67'
DATA12_1 DC X'FFFFFFFFFFFF1234'
DATA12_2 DC X'012345'
DATA12_TEMP DC X'67'
DATA13_1 DC X'FFFFFFFFFFFF0000'
DATA13_2 DC X'01234567'
DATA14_1 DC X'FFFFFFFFFFFF0123'
DATA14_2 DC X'01234567'
DATA15_1 DC X'FFFFFFFFFFFF0012'
DATA15_2 DC X'01234567'
DATA16_1 DC X'FFFFFFFFFFFF2345'
DATA16_2 DC X'01234567'
DATA17_1 DC X'FFFFFFFFFFFF0000'
DATA17_2 DC X'0123456789ABCDEF'
DATA18_1 DC X'FFFFFFFFFFFF0123'
DATA18_2 DC X'0123456789ABCDEF'
DATA19_1 DC X'FFFFFFFFFFFF0012'
DATA19_2 DC X'0123456789ABCDEF'
DATA20_1 DC X'FFFFFFFFFFFF2345'
DATA20_2 DC X'0123456789ABCDEF'
DATA21_1 DC X'FFFFFFFFFFFF0123'
DATA21_2 DC X'0123456789ABCDEF'
DATA22_1 DC X'FFFFFFFFFFFF0012'
DATA22_2 DC X'0123456789ABCDEF'
DATA23_1 DC X'FFFFFFFFFFFF2345'
DATA23_2 DC X'0123456789ABCDEF'
DATA24_1 DC X'FFFFFFFFFFFF0123'
DATA24_2 DC X'0123456789ABCDEF'
DATA25_1 DC X'FFFFFFFFFFFF0012'
DATA25_2 DC X'0123456789ABCDEF'
DATA26_1 DC X'FFFFFFFFFFFF2345'
DATA26_2 DC X'0123456789ABCDEF'
DATA27_1 DC X'FFFFFFFFFFFF0123'
DATA27_2 DC X'0123456789ABCDEF'
DATA28_1 DC X'FFFFFFFFFFFF0012'
DATA28_2 DC X'0123456789ABCDEF'
DATA29_1 DC X'FFFFFFFFFFFF2345'
DATA29_2 DC X'0123456789ABCDEF'
DATA30_1 DC X'FFFFFFFF12345678'
DATA30_2 DC X'01'
DATA30_TEMP DC X'234567'
DATA31_1 DC X'FFFFFFFF12345601'
DATA31_2 DC X'01'
DATA31_TEMP DC X'234567'
DATA32_1 DC X'FFFFFFFF12345600'
DATA32_2 DC X'01'
DATA32_TEMP DC X'234567'
DATA33_1 DC X'FFFFFFFF12345602'
DATA33_2 DC X'01'
DATA33_TEMP DC X'234567'
DATA34_1 DC X'FFFFFFFF12345678'
DATA34_2 DC X'0123'
DATA34_TEMP DC X'4567'
DATA35_1 DC X'FFFFFFFF12340123'
DATA35_2 DC X'0123'
DATA35_TEMP DC X'4567'
DATA36_1 DC X'FFFFFFFF12340012'
DATA36_2 DC X'0123'
DATA36_TEMP DC X'4567'
DATA37_1 DC X'FFFFFFFF12340124'
DATA37_2 DC X'0123'
DATA37_TEMP DC X'4567'
DATA38_1 DC X'FFFFFFFF12345678'
DATA38_2 DC X'012345'
DATA38_TEMP DC X'67'
DATA39_1 DC X'FFFFFFFF12012345'
DATA39_2 DC X'012345'
DATA39_TEMP DC X'67'
DATA40_1 DC X'FFFFFFFF12001234'
DATA40_2 DC X'012345'
DATA40_TEMP DC X'67'
DATA41_1 DC X'FFFFFFFF12012346'
DATA41_2 DC X'012345'
DATA41_TEMP DC X'67'
DATA42_1 DC X'FFFFFFFF12345678'
DATA42_2 DC X'01234567'
DATA43_1 DC X'FFFFFFFF01234567'
DATA43_2 DC X'01234567'
DATA44_1 DC X'FFFFFFFF01234566'
DATA44_2 DC X'01234567'
DATA45_1 DC X'FFFFFFFF01234568'
DATA45_2 DC X'01234567'
DATA46_1 DC X'FFFFFFFF12345678'
DATA46_2 DC X'0123456789ABCDEF'
DATA47_1 DC X'FFFFFFFF12345601'
DATA47_2 DC X'0123456789ABCDEF'
DATA48_1 DC X'FFFFFFFF12345600'
DATA48_2 DC X'0123456789ABCDEF'
DATA49_1 DC X'FFFFFFFF12345602'
DATA49_2 DC X'0123456789ABCDEF'
DATA50_1 DC X'FFFFFFFF00000123'
DATA50_2 DC X'0123456789ABCDEF'
                END
