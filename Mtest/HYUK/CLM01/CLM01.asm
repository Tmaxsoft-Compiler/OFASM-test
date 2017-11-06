*************************************************
* FILENAME : CLM01.asm
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
CLM01           CSECT
                LR          12,15
                USING       CLM01,12
* unsigned 32bits unsigned 4bytes< 3,5,6,9,10,12 oprand1<oprand2
   MACRO_CLM   DATA51_1,DATA51_2,3
* unsigned 32bits unsigned 4bytes< 3,5,6,9,10,12 oprand1>oprand2
   MACRO_CLM   DATA52_1,DATA52_2,3
* unsigned 32bits unsigned 4bytes< 7,11,13,14 oprand1=oprand2
   MACRO_CLM   DATA53_1,DATA53_2,7
* unsigned 32bits unsigned 4bytes< 7,11,13,14 oprand1<oprand2
   MACRO_CLM   DATA54_1,DATA54_2,7
* unsigned 32bits unsigned 4bytes< 7,11,13,14 oprand1>oprand2
   MACRO_CLM   DATA55_1,DATA55_2,7
* unsigned 32bits unsigned 4bytes< 15 oprand1=oprand2
   MACRO_CLM   DATA56_1,DATA56_2,15
* unsigned 32bits unsigned 4bytes< 15 oprand1<oprand2
   MACRO_CLM   DATA57_1,DATA57_2,15
* unsigned 32bits unsigned 4bytes< 15 oprand1>oprand2
   MACRO_CLM   DATA58_1,DATA58_2,15
* unsigned 64bits unsigned 1byte 0 mask bits all zeros
   MACRO_CLM   DATA59_1,DATA59_2,0
* unsigned 64bits unsigned 1byte 1,2,4,8 oprand1=oprand2
   MACRO_CLM   DATA60_1,DATA60_2,1
* unsigned 64bits unsigned 1byte 1,2,4,8 oprand1<oprand2
   MACRO_CLM   DATA61_1,DATA61_2,1
* unsigned 64bits unsigned 1byte 1,2,4,8 oprand1>oprand2
   MACRO_CLM   DATA62_1,DATA62_2,1
* unsigned 64bits unsigned 2bytes 0 mask bits all zeros
   MACRO_CLM   DATA63_1,DATA63_2,0
* unsigned 64bits unsigned 2bytes 3,5,6,9,10,12 oprand1=oprand2
   MACRO_CLM   DATA64_1,DATA64_2,3
* unsigned 64bits unsigned 2bytes 3,5,6,9,10,12 oprand1<oprand2
                MACRO_CLM   DATA65_1,DATA65_2,3
* unsigned 64bits unsigned 2bytes 3,5,6,9,10,12 oprand1>oprand2
                MACRO_CLM   DATA66_1,DATA66_2,3
* unsigned 64bits unsigned 3bytes 0 mask bits all zeros
                MACRO_CLM   DATA67_1,DATA67_2,0
* unsigned 64bits unsigned 3bytes 7,11,13,14 oprand1=oprand2
                MACRO_CLM   DATA68_1,DATA68_2,7
* unsigned 64bits unsigned 3bytes 7,11,13,14 oprand1<oprand2
                MACRO_CLM   DATA69_1,DATA69_2,7
* unsigned 64bits unsigned 3bytes 7,11,13,14 oprand1>oprand2
                MACRO_CLM   DATA70_1,DATA70_2,7
* unsigned 64bits unsigned 4bytes 0 mask bits all zeros
                MACRO_CLM   DATA71_1,DATA71_2,0
* unsigned 64bits unsigned 4bytes 15 oprand1=oprand2
                MACRO_CLM   DATA72_1,DATA72_2,15
* unsigned 64bits unsigned 4bytes 15 oprand1<oprand2
                MACRO_CLM   DATA73_1,DATA73_2,15
* unsigned 64bits unsigned 4bytes 15 oprand1>oprand2
                MACRO_CLM   DATA74_1,DATA74_2,15
* unsigned 64bits unsigned 4bytes< 0 mask bits all zeros
                MACRO_CLM   DATA75_1,DATA75_2,0
* unsigned 64bits unsigned 4bytes< 1,2,4,8 oprand1=oprand2
                MACRO_CLM   DATA76_1,DATA76_2,1
* unsigned 64bits unsigned 4bytes< 1,2,4,8 oprand1<oprand2
                MACRO_CLM   DATA77_1,DATA77_2,1
* unsigned 64bits unsigned 4bytes< 1,2,4,8 oprand1>oprand2
                MACRO_CLM   DATA78_1,DATA78_2,1
* unsigned 64bits unsigned 4bytes< 3,5,6,9,10,12 oprand1=oprand2
                MACRO_CLM   DATA79_1,DATA79_2,3
* unsigned 64bits unsigned 4bytes< 3,5,6,9,10,12 oprand1<oprand2
                MACRO_CLM   DATA80_1,DATA80_2,3
* unsigned 64bits unsigned 4bytes< 3,5,6,9,10,12 oprand1>oprand2
                MACRO_CLM   DATA81_1,DATA81_2,3
* unsigned 64bits unsigned 4bytes< 7,11,13,14 oprand1=oprand2
                MACRO_CLM   DATA82_1,DATA82_2,7
* unsigned 64bits unsigned 4bytes< 7,11,13,14 oprand1<oprand2
                MACRO_CLM   DATA83_1,DATA83_2,7
* unsigned 64bits unsigned 4bytes< 7,11,13,14 oprand1>oprand2
                MACRO_CLM   DATA84_1,DATA84_2,7
* unsigned 64bits unsigned 4bytes< 15 oprand1=oprand2
                MACRO_CLM   DATA85_1,DATA85_2,15
* unsigned 64bits unsigned 4bytes< 15 oprand1<oprand2
                MACRO_CLM   DATA86_1,DATA86_2,15
* unsigned 64bits unsigned 4bytes< 15 oprand1>oprand2
                MACRO_CLM   DATA87_1,DATA87_2,15
                BR          14
DATA51_1 DC X'FFFFFFFF00000122'
DATA51_2 DC X'0123456789ABCDEF'
DATA52_1 DC X'FFFFFFFF00000124'
DATA52_2 DC X'0123456789ABCDEF'
DATA53_1 DC X'FFFFFFFF00012345'
DATA53_2 DC X'0123456789ABCDEF'
DATA54_1 DC X'FFFFFFFF00012344'
DATA54_2 DC X'0123456789ABCDEF'
DATA55_1 DC X'FFFFFFFF00012346'
DATA55_2 DC X'0123456789ABCDEF'
DATA56_1 DC X'FFFFFFFF01234567'
DATA56_2 DC X'0123456789ABCDEF'
DATA57_1 DC X'FFFFFFFF01234566'
DATA57_2 DC X'0123456789ABCDEF'
DATA58_1 DC X'FFFFFFFF01234568'
DATA58_2 DC X'0123456789ABCDEF'
DATA59_1 DC X'0123456789ABCDEF'
DATA59_2 DC X'01'
DATA59_TEMP DC X'234567'
DATA60_1 DC X'0123456789ABCD01'
DATA60_2 DC X'01'
DATA60_TEMP DC X'234567'
DATA61_1 DC X'0123456789ABCD00'
DATA61_2 DC X'01'
DATA61_TEMP DC X'234567'
DATA62_1 DC X'0123456789ABCD02'
DATA62_2 DC X'01'
DATA62_TEMP DC X'234567'
DATA63_1 DC X'0123456789ABCDEF'
DATA63_2 DC X'0123'
DATA63_TEMP DC X'4567'
DATA64_1 DC X'0123456789AB0123'
DATA64_2 DC X'0123'
DATA64_TEMP DC X'4567'
DATA65_1 DC X'0123456789AB0122'
DATA65_2 DC X'0123'
DATA65_TEMP DC X'4567'
DATA66_1 DC X'0123456789AB0124'
DATA66_2 DC X'0123'
DATA66_TEMP DC X'4567'
DATA67_1 DC X'0123456789ABCDEF'
DATA67_2 DC X'012345'
DATA67_TEMP DC X'67'
DATA68_1 DC X'0123456789012345'
DATA68_2 DC X'012345'
DATA68_TEMP DC X'67'
DATA69_1 DC X'0123456789012344'
DATA69_2 DC X'012345'
DATA69_TEMP DC X'67'
DATA70_1 DC X'0123456789012346'
DATA70_2 DC X'012345'
DATA70_TEMP DC X'67'
DATA71_1 DC X'0123456789ABCDEF'
DATA71_2 DC X'01234567'
DATA72_1 DC X'0123456701234567'
DATA72_2 DC X'01234567'
DATA73_1 DC X'0123456701234566'
DATA73_2 DC X'01234567'
DATA74_1 DC X'0123456701234568'
DATA74_2 DC X'01234567'
DATA75_1 DC X'0123456789ABCDEF'
DATA75_2 DC X'0123456789ABCDEF'
DATA76_1 DC X'0123456789ABCD01'
DATA76_2 DC X'0123456789ABCDEF'
DATA77_1 DC X'0123456789ABCD00'
DATA77_2 DC X'0123456789ABCDEF'
DATA78_1 DC X'0123456789ABCD02'
DATA78_2 DC X'0123456789ABCDEF'
DATA79_1 DC X'0123456789AB0123'
DATA79_2 DC X'0123456789ABCDEF'
DATA80_1 DC X'0123456789AB0122'
DATA80_2 DC X'0123456789ABCDEF'
DATA81_1 DC X'0123456789AB0124'
DATA81_2 DC X'0123456789ABCDEF'
DATA82_1 DC X'0123456789012345'
DATA82_2 DC X'0123456789ABCDEF'
DATA83_1 DC X'0123456789012344'
DATA83_2 DC X'0123456789ABCDEF'
DATA84_1 DC X'0123456789012346'
DATA84_2 DC X'0123456789ABCDEF'
DATA85_1 DC X'0123456701234567'
DATA85_2 DC X'0123456789ABCDEF'
DATA86_1 DC X'0123456701234566'
DATA86_2 DC X'0123456789ABCDEF'
DATA87_1 DC X'0123456701234568'
DATA87_2 DC X'0123456789ABCDEF'
                END
