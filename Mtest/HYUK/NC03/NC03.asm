*************************************************
* FILENAME : NC03.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 113
*************************************************
     MACRO
     MAC_NC      &VALUE1,&VALUE2
     NC          &VALUE1,&VALUE2
     OFADBGMEM   &VALUE1,0
     OFADBGREG   2
     MEND
NC03 CSECT
     LR          12,15
     USING       NC03,12
* operand1 len == operand2 len
** result(operand1) = 0
     MAC_NC      DT1,DT2 
** result(operand1) = not 0
     MAC_NC      DT3,DT4

* operand1 len > operand2 len
** result(operand1) = 0
     MAC_NC      DT5,DT6
** result(operand1) = not 0
     MAC_NC      DT7,DT8

* operand1 len < operand2 len
** result(operand1) = 0
     MAC_NC      DT9,DT10
** result(operand1) = not 0
     MAC_NC      DT11,DT12

     BR          14
     END
DT1  DC          X'0123456789ABCDEF'
DT2  DC          X'FEDCBA9876543210'
DT3  DC          X'0123456789ABCDEF'
DT4  DC          X'FEDCBA9876543211'
DT5  DC          X'0123456789ABCDEF0123456789ABCDEF'
DT6  DC          X'0000000000000000'
     DC          X'0000000000000000'
DT7  DC          X'0123456789ABCDEF0123456789ABCDEF'
DT8  DC          X'0000000000000000'
     DC          X'0000000000000001'
DT9  DC          X'0123456789ABCDEF'
     DC          X'FFFFFFFFFFFFFFFF'
DT10 DC          X'FEDCBA9876543210FFFFFFFFFFFFFFFF'
DT11 DC          X'0123456789ABCDEF'
     DC          X'0000000000000000'
DT12 DC          X'FEDCBA9876543211FFFFFFFFFFFFFFFF'
