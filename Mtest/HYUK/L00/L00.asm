                MACRO
                MACRO_L     &VALUE1,&VALUE2
                LG          2,&VALUE1
                OFADBGREG   2
                OFADBGMEM   &VALUE2,0
                L           2,&VALUE2
                OFADBGREG   2
                OFADBGMEM   &VALUE2,0
                MEND
L00             CSECT
                LR          12,15
                USING       L00,12
* 0	16bits	0	32bits>
                MACRO_L     DATA1_1,DATA1_2
* 0	16bits	0	32bits
                MACRO_L     DATA2_1,DATA2_2
* 0	16bits	0	32bits<
                MACRO_L     DATA3_1,DATA3_2
* 0	16bits	0<	32bits>
                MACRO_L     DATA4_1,DATA4_2
* 0	16bits	0<	32bits
                MACRO_L     DATA5_1,DATA5_2
* 0	16bits	0<	32bits<
                MACRO_L     DATA6_1,DATA6_2
* 0	16bits	0>	32bits>
                MACRO_L     DATA7_1,DATA7_2
* 0	16bits	0>	32bits
                MACRO_L     DATA8_1,DATA8_2
* 0	16bits	0>	32bits<
                MACRO_L     DATA9_1,DATA9_2
* 0	32bits	0	32bits>
                MACRO_L     DATA10_1,DATA10_2
* 0	32bits	0	32bits
                MACRO_L     DATA11_1,DATA11_2
* 0	32bits	0	32bits<
                MACRO_L     DATA12_1,DATA12_2
* 0	32bits	0<	32bits>
                MACRO_L     DATA13_1,DATA13_2
* 0	32bits	0<	32bits
                MACRO_L     DATA14_1,DATA14_2
* 0	32bits	0<	32bits<
                MACRO_L     DATA15_1,DATA15_2
* 0	32bits	0>	32bits>
                MACRO_L     DATA16_1,DATA16_2
* 0	32bits	0>	32bits
                MACRO_L     DATA17_1,DATA17_2
* 0	32bits	0>	32bits<
                MACRO_L     DATA18_1,DATA18_2
* 0	64bits	0	32bits>
                MACRO_L     DATA19_1,DATA19_2
* 0	64bits	0	32bits
                MACRO_L     DATA20_1,DATA20_2
* 0	64bits	0	32bits<
                MACRO_L     DATA21_1,DATA21_2
* 0	64bits	0<	32bits>
                MACRO_L     DATA22_1,DATA22_2
* 0	64bits	0<	32bits
                MACRO_L     DATA23_1,DATA23_2
* 0	64bits	0<	32bits<
                MACRO_L     DATA24_1,DATA24_2
* 0	64bits	0>	32bits>
                MACRO_L     DATA25_1,DATA25_2
* 0	64bits	0>	32bits
                MACRO_L     DATA26_1,DATA26_2
* 0	64bits	0>	32bits<
                MACRO_L     DATA27_1,DATA27_2
* 0<	16bits	0	32bits>
                MACRO_L     DATA28_1,DATA28_2
* 0<	16bits	0	32bits
                MACRO_L     DATA29_1,DATA29_2
* 0<	16bits	0	32bits<
                MACRO_L     DATA30_1,DATA30_2
* 0<	16bits	0<	32bits>
                MACRO_L     DATA31_1,DATA31_2
* 0<	16bits	0<	32bits
                MACRO_L     DATA32_1,DATA32_2
* 0<	16bits	0<	32bits<
                MACRO_L     DATA33_1,DATA33_2
* 0<	16bits	0>	32bits>
                MACRO_L     DATA34_1,DATA34_2
* 0<	16bits	0>	32bits
                MACRO_L     DATA35_1,DATA35_2
* 0<	16bits	0>	32bits<
                MACRO_L     DATA36_1,DATA36_2
* 0<	32bits	0	32bits>
                MACRO_L     DATA37_1,DATA37_2
* 0<	32bits	0	32bits
                MACRO_L     DATA38_1,DATA38_2
* 0<	32bits	0	32bits<
                MACRO_L     DATA39_1,DATA39_2
* 0<	32bits	0<	32bits>
                MACRO_L     DATA40_1,DATA40_2
* 0<	32bits	0<	32bits
                MACRO_L     DATA41_1,DATA41_2
* 0<	32bits	0<	32bits<
                MACRO_L     DATA42_1,DATA42_2
* 0<	32bits	0>	32bits>
                MACRO_L     DATA43_1,DATA43_2
* 0<	32bits	0>	32bits
                MACRO_L     DATA44_1,DATA44_2
* 0<	32bits	0>	32bits<
                MACRO_L     DATA45_1,DATA45_2
* 0<	64bits	0	32bits>
                MACRO_L     DATA46_1,DATA46_2
* 0<	64bits	0	32bits
                MACRO_L     DATA47_1,DATA47_2
* 0<	64bits	0	32bits<
                MACRO_L     DATA48_1,DATA48_2
* 0<	64bits	0<	32bits>
                MACRO_L     DATA49_1,DATA49_2
* 0<	64bits	0<	32bits
                MACRO_L     DATA50_1,DATA50_2
* 0<	64bits	0<	32bits<
                MACRO_L     DATA51_1,DATA51_2
* 0<	64bits	0>	32bits>
                MACRO_L     DATA52_1,DATA52_2
* 0<	64bits	0>	32bits
                MACRO_L     DATA53_1,DATA53_2
* 0<	64bits	0>	32bits<
                MACRO_L     DATA54_1,DATA54_2
* 0>	16bits	0	32bits>
                MACRO_L     DATA55_1,DATA55_2
* 0>	16bits	0	32bits
                MACRO_L     DATA56_1,DATA56_2
* 0>	16bits	0	32bits<
                MACRO_L     DATA57_1,DATA57_2
* 0>	16bits	0<	32bits>
                MACRO_L     DATA58_1,DATA58_2
* 0>	16bits	0<	32bits
                MACRO_L     DATA59_1,DATA59_2
* 0>	16bits	0<	32bits<
                MACRO_L     DATA60_1,DATA60_2
* 0>	16bits	0>	32bits>
                MACRO_L     DATA61_1,DATA61_2
* 0>	16bits	0>	32bits
                MACRO_L     DATA62_1,DATA62_2
* 0>	16bits	0>	32bits<
                MACRO_L     DATA63_1,DATA63_2
* 0>	32bits	0	32bits>
                MACRO_L     DATA64_1,DATA64_2
* 0>	32bits	0	32bits
                MACRO_L     DATA65_1,DATA65_2
* 0>	32bits	0	32bits<
                MACRO_L     DATA66_1,DATA66_2
* 0>	32bits	0<	32bits>
                MACRO_L     DATA67_1,DATA67_2
* 0>	32bits	0<	32bits
                MACRO_L     DATA68_1,DATA68_2
* 0>	32bits	0<	32bits<
                MACRO_L     DATA69_1,DATA69_2
* 0>	32bits	0>	32bits>
                MACRO_L     DATA70_1,DATA70_2
* 0>	32bits	0>	32bits
                MACRO_L     DATA71_1,DATA71_2
* 0>	32bits	0>	32bits<
                MACRO_L     DATA72_1,DATA72_2
* 0>	64bits	0	32bits>
                MACRO_L     DATA73_1,DATA73_2
* 0>	64bits	0	32bits
                MACRO_L     DATA74_1,DATA74_2
* 0>	64bits	0	32bits<
                MACRO_L     DATA75_1,DATA75_2
* 0>	64bits	0<	32bits>
                MACRO_L     DATA76_1,DATA76_2
* 0>	64bits	0<	32bits
                MACRO_L     DATA77_1,DATA77_2
* 0>	64bits	0<	32bits<
                MACRO_L     DATA78_1,DATA78_2
* 0>	64bits	0>	32bits>
                MACRO_L     DATA79_1,DATA79_2
* 0>	64bits	0>	32bits
                MACRO_L     DATA80_1,DATA80_2
* 0>	64bits	0>	32bits<
                MACRO_L     DATA81_1,DATA81_2
                BR          14
                END
DATA1_1 DC X'FFFFFFFFFFFF0000'
DATA1_2 DC X'0000'
DATA1_TEMP DC X'1234'
DATA2_1 DC X'FFFFFFFFFFFF0000'
DATA2_2 DC X'00000000'
DATA3_1 DC X'FFFFFFFFFFFF0000'
DATA3_2 DC X'0000000000000000'
DATA4_1 DC X'FFFFFFFFFFFF0000'
DATA4_2 DC X'5678'
DATA4_TEMP DC X'1234'
DATA5_1 DC X'FFFFFFFFFFFF0000'
DATA5_2 DC X'56789ABC'
DATA6_1 DC X'FFFFFFFFFFFF0000'
DATA6_2 DC X'123456789ABCDEF0'
DATA7_1 DC X'FFFFFFFFFFFF0000'
DATA7_2 DC X'F000'
DATA7_TEMP DC X'1234'
DATA8_1 DC X'FFFFFFFFFFFF0000'
DATA8_2 DC X'FFFF0000'
DATA9_1  DC X'FFFFFFFFFFFF0000'
DATA9_2 DC X'FFFF000000000000'
DATA10_1 DC X'FFFFFFFF00000000'
DATA10_2 DC X'0000'
DATA10_TEMP DC X'1234'
DATA11_1 DC X'FFFFFFFF00000000'
DATA11_2 DC X'00000000'
DATA12_1 DC X'FFFFFFFF00000000'
DATA12_2 DC X'0000000000000000'
DATA13_1 DC X'FFFFFFFF00000000'
DATA13_2 DC X'5678'
DATA13_TEMP DC X'1234'
DATA14_1 DC X'FFFFFFFF00000000'
DATA14_2 DC X'56789ABC'
DATA15_1 DC X'FFFFFFFF00000000'
DATA15_2 DC X'123456789ABCDEF0'
DATA16_1 DC X'FFFFFFFF00000000'
DATA16_2 DC X'F000'
DATA16_TEMP DC X'1234'
DATA17_1 DC X'FFFFFFFF00000000'
DATA17_2 DC X'FFFF0000'
DATA18_1 DC X'FFFFFFFF00000000'
DATA18_2 DC X'FFFF000000000000'
DATA19_1 DC X'0000000000000000'
DATA19_2 DC X'0000'
DATA19_TEMP DC X'1234'
DATA20_1 DC X'0000000000000000'
DATA20_2 DC X'00000000'
DATA21_1 DC X'0000000000000000'
DATA21_2 DC X'0000000000000000'
DATA22_1 DC X'0000000000000000'
DATA22_2 DC X'5678'
DATA22_TEMP DC X'1234'
DATA23_1 DC X'0000000000000000'
DATA23_2 DC X'56789ABC'
DATA24_1 DC X'0000000000000000'
DATA24_2 DC X'123456789ABCDEF0'
DATA25_1 DC X'0000000000000000'
DATA25_2 DC X'F000'
DATA25_TEMP DC X'1234'
DATA26_1 DC X'0000000000000000'
DATA26_2 DC X'FFFF0000'
DATA27_1 DC X'0000000000000000'
DATA27_2 DC X'FFFF000000000000'
DATA28_1 DC X'FFFFFFFFFFFF0123'
DATA28_2 DC X'0000'
DATA28_TEMP DC X'1234'
DATA29_1 DC X'FFFFFFFFFFFF0123'
DATA29_2 DC X'00000000'
DATA30_1 DC X'FFFFFFFFFFFF0123'
DATA30_2 DC X'0000000000000000'
DATA31_1 DC X'FFFFFFFFFFFF0123'
DATA31_2 DC X'5678'
DATA31_TEMP DC X'1234'
DATA32_1 DC X'FFFFFFFFFFFF0123'
DATA32_2 DC X'56789ABC'
DATA33_1 DC X'FFFFFFFFFFFF0123'
DATA33_2 DC X'123456789ABCDEF0'
DATA34_1 DC X'FFFFFFFFFFFF0123'
DATA34_2 DC X'F000'
DATA34_TEMP DC X'1234'
DATA35_1 DC X'FFFFFFFFFFFF0123'
DATA35_2 DC X'FFFF0000'
DATA36_1 DC X'FFFFFFFFFFFF0123'
DATA36_2 DC X'FFFF000000000000'
DATA37_1 DC X'FFFFFFFF01234567'
DATA37_2 DC X'0000'
DATA37_TEMP DC X'1234'
DATA38_1 DC X'FFFFFFFF01234567'
DATA38_2 DC X'00000000'
DATA39_1 DC X'FFFFFFFF01234567'
DATA39_2 DC X'0000000000000000'
DATA40_1 DC X'FFFFFFFF01234567'
DATA40_2 DC X'5678'
DATA40_TEMP DC X'1234'
DATA41_1 DC X'FFFFFFFF01234567'
DATA41_2 DC X'56789ABC'
DATA42_1 DC X'FFFFFFFF01234567'
DATA42_2 DC X'123456789ABCDEF0'
DATA43_1 DC X'FFFFFFFF01234567'
DATA43_2 DC X'F000'
DATA43_TEMP DC X'1234'
DATA44_1 DC X'FFFFFFFF01234567'
DATA44_2 DC X'FFFF0000'
DATA45_1 DC X'FFFFFFFF01234567'
DATA45_2 DC X'FFFF000000000000'
DATA46_1 DC X'0123456789ABCDEF'
DATA46_2 DC X'0000'
DATA46_TEMP DC X'1234'
DATA47_1 DC X'0123456789ABCDEF'
DATA47_2 DC X'00000000'
DATA48_1 DC X'0123456789ABCDEF'
DATA48_2 DC X'0000000000000000'
DATA49_1 DC X'0123456789ABCDEF'
DATA49_2 DC X'5678'
DATA49_TEMP DC X'1234'
DATA50_1 DC X'0123456789ABCDEF'
DATA50_2 DC X'56789ABC'
DATA51_1 DC X'0123456789ABCDEF'
DATA51_2 DC X'123456789ABCDEF0'
DATA52_1 DC X'0123456789ABCDEF'
DATA52_2 DC X'F000'
DATA52_TEMP DC X'1234'
DATA53_1 DC X'0123456789ABCDEF'
DATA53_2 DC X'FFFF0000'
DATA54_1 DC X'0123456789ABCDEF'
DATA54_2 DC X'FFFF000000000000'
DATA55_1 DC X'000000000000F000'
DATA55_2 DC X'0000'
DATA55_TEMP DC X'1234'
DATA56_1 DC X'000000000000F000'
DATA56_2 DC X'00000000'
DATA57_1 DC X'000000000000F000'
DATA57_2 DC X'0000000000000000'
DATA58_1 DC X'000000000000F000'
DATA58_2 DC X'5678'
DATA58_TEMP DC X'1234'
DATA59_1 DC X'000000000000F000'
DATA59_2 DC X'56789ABC'
DATA60_1 DC X'000000000000F000'
DATA60_2 DC X'123456789ABCDEF0'
DATA61_1 DC X'000000000000F000'
DATA61_2 DC X'F000'
DATA61_TEMP DC X'1234'
DATA62_1 DC X'000000000000F000'
DATA62_2 DC X'FFFF0000'
DATA63_1 DC X'000000000000F000'
DATA63_2 DC X'FFFF000000000000'
DATA64_1 DC X'00000000F0000000'
DATA64_2 DC X'0000'
DATA64_TEMP DC X'1234'
DATA65_1 DC X'00000000F0000000'
DATA65_2 DC X'00000000'
DATA66_1 DC X'00000000F0000000'
DATA66_2 DC X'0000000000000000'
DATA67_1 DC X'00000000F0000000'
DATA67_2 DC X'5678'
DATA67_TEMP DC X'1234'
DATA68_1 DC X'00000000F0000000'
DATA68_2 DC X'56789ABC'
DATA69_1 DC X'00000000F0000000'
DATA69_2 DC X'123456789ABCDEF0'
DATA70_1 DC X'00000000F0000000'
DATA70_2 DC X'F000'
DATA70_TEMP DC X'1234'
DATA71_1 DC X'00000000F0000000'
DATA71_2 DC X'FFFF0000'
DATA72_1 DC X'00000000F0000000'
DATA72_2 DC X'FFFF000000000000'
DATA73_1 DC X'F000000000000000'
DATA73_2 DC X'0000'
DATA73_TEMP DC X'1234'
DATA74_1 DC X'F000000000000000'
DATA74_2 DC X'00000000'
DATA75_1 DC X'F000000000000000'
DATA75_2 DC X'0000000000000000'
DATA76_1 DC X'F000000000000000'
DATA76_2 DC X'5678'
DATA76_TEMP DC X'1234'
DATA77_1 DC X'F000000000000000'
DATA77_2 DC X'56789ABC'
DATA78_1 DC X'F000000000000000'
DATA78_2 DC X'123456789ABCDEF0'
DATA79_1 DC X'F000000000000000'
DATA79_2 DC X'F000'
DATA79_TEMP DC X'1234'
DATA80_1 DC X'F000000000000000'
DATA80_2 DC X'FFFF0000'
DATA81_1 DC X'F000000000000000'
DATA81_2 DC X'FFFF000000000000'
