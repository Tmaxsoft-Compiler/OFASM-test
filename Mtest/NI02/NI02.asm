*************************************************
* FILENAME : NI02.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 113
*************************************************
        MACRO
        MAC_NI      &VALUE1,&VALUE2
        NI          &VALUE1,&VALUE2
        OFADBGMEM   &VALUE1,0
        OFADBGREG   2
        MEND
NI02    CSECT
        LR          12,15
        USING       NI02,12

* operand1 1byte, operand2 1byte
** result 0
        MAC_NI      DATA1,X'00'
** retult not 0
        MAC_NI      DATA2,X'01'
* operand1 1byte, operand2 4bits
** result 0
        MAC_NI      DATA3,B'0000'
** result not 0
        MAC_NI      DATA4,B'1111'
* operand1 1byte, operand2 over 1byte
** result 0
        MAC_NI      DATA5,X'FF00'
** result not 0
        MAC_NI      DATA6,X'00FF'
* operand1 4bits, operand2 1byte
** result 0
        MAC_NI      DATA7,X'F0'
** result not 0
        MAC_NI      DATA8,X'FF'
* operand1 4bits, operand2 4bits
** result 0
        MAC_NI      DATA9,B'0000'
** result not 0
        MAC_NI      DATA10,B'1111'
* operand1 4bits, operand2 over 1byte
** result 0
        MAC_NI      DATA11,X'FFF0'
** result not 0
        MAC_NI      DATA12,X'00FF'
* operand1 over 1byte, operand2 1byte
** result 0
        MAC_NI      DATA13,X'F0'
** result not 0
        MAC_NI      DATA14,X'FF'
* operand1 over 1byte, operand2 4bits
** result 0
        MAC_NI      DATA15,B'0000'
** result not 0
        MAC_NI      DATA16,B'1111'
* operand1 over 1byte, operand2 over 1byte
** result 0
        MAC_NI      DATA17,X'FFFFFFFFFFFFF0'                            IMMEDIATE 7BYTES
        MAC_NI      DATA18,X'7FFFFFFFFFFFFFFE'                          IMMEDIATE 8BYTES
        MAC_NI      DATA19,X'007FFFFFFFFFFFFFFE'                        IMMEDIATE 9BYTES
** result not 0
        MAC_NI      DATA20,X'0123456789ABCDEF'
        MAC_NI      DATA21,X'FFFFFFFFFFFFFFFE'
        MAC_NI      DATA22,X'00FFFFFFFFFFFFFFFE'

        BR          14
        END
DATA1   DC          X'FF'
DATA2   DC          X'FF'
DATA3   DC          X'FF'
DATA4   DC          X'FF'
DATA5   DC          X'FF'
DATA6   DC          X'FF'
DATA7   DC          B'1111'
DATA8   DC          B'1111'
DATA9   DC          B'1111'
DATA10  DC          B'1111'
DATA11  DC          B'1111'
DATA12  DC          B'1111'
DATA13  DC          X'0123456789ABCDEF'
DATA14  DC          X'0123456789ABCDEF'
DATA15  DC          X'0123456789ABCDEF'
DATA16  DC          X'0123456789ABCDEF'
DATA17  DC          X'0123456789ABCDEF'
DATA18  DC          X'0123456789ABCDEF'
DATA19  DC          X'0123456789ABCDEF'
DATA20  DC          X'0123456789ABCDEF'
DATA21  DC          X'0123456789ABCDEF'
DATA22  DC          X'0123456789ABCDEF'
