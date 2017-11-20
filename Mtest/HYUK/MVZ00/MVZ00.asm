*************************************************
* FILENAME : MVZ00.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 169
*************************************************
                MACRO
                MACRO_MVZ   &VALUE1,&VALUE2,&LEN1,&LEN2
                OFADBGMEM   &VALUE1,0
                OFADBGMEM   &VALUE2,0
                LA          2,&VALUE1
                LA          3,&VALUE2
                MVZ         0(&LEN1,2),0(3)
                OFADBGMEM   &VALUE1,0
                OFADBGMEM   &VALUE2,0
                MEND
MVZ00           CSECT
                LR          12,15
                USING       MVZ00,12
* TESTCASE_1    invalid length  op1 length=op2 length
                MACRO_MVZ   DATA1_1,DATA1_2,0,0
* TESTCASE_2    invalid length  op1 length=op2 length
                MACRO_MVZ   DATA2_1,DATA2_2,0,0
* TESTCASE_3    invalid length  op1 length>op2 length   longer op
*                MACRO_MVZ   DATA3_1,DATA3_2,257,0
* TESTCASE_4    invalid length  op1 length>op2 length   shorter op
*                MACRO_MVZ   DATA4_1,DATA4_2,257,0
* TESTCASE_5    invalid length  op1 length<op2 length   longer op
                MACRO_MVZ   DATA5_1,DATA5_2,0,257
* TESTCASE_6    invalid length  op1 length<op2 length   shorter op
                MACRO_MVZ   DATA6_1,DATA6_2,0,257
* TESTCASE_7    valid length(1~256) op1 length=op2 length
                MACRO_MVZ   DATA7_1,DATA7_2,8,8
* TESTCASE_9    valid length(1~256) op1 length>op2 length   longer op
                MACRO_MVZ   DATA8_1,DATA8_2,8,4
* TESTCASE_10   valid length(1~256) op1 length>op2 length   shorter op
                MACRO_MVZ   DATA9_1,DATA9_2,8,4
* TESTCASE_11   valid length(1~256) op1 length<op2 length   longer op
                MACRO_MVZ   DATA10_1,DATA10_2,4,8
* TESTCASE_12   valid length(1~256) op1 length<op2 length   shorter op
                MACRO_MVZ   DATA11_1,DATA11_2,4,8
                BR          14
DATA1_1 DC X'0123456789ABCDEF'
DATA1_2 DC X'FEDCBA9876543210'
DATA2_1 DC X'0123456789ABCDEF'
DATA2_2 DC X'FEDCBA9876543210'
DATA3_1 DC X'0123456789ABCDEF'
DATA3_2 DC X'FEDCBA9876543210'
DATA4_1 DC X'0123456789ABCDEF'
DATA4_2 DC X'FEDCBA9876543210'
DATA5_1 DC X'0123456789ABCDEF'
DATA5_2 DC X'FEDCBA9876543210'
DATA6_1 DC X'0123456789ABCDEF'
DATA6_2 DC X'FEDCBA9876543210'
DATA7_1 DC X'0123456789ABCDEF'
DATA7_2 DC X'FEDCBA9876543210'
DATA8_1 DC X'0123456789ABCDEF'
DATA8_2 DC X'FEDCBA9876543210'
DATA9_1 DC X'0123456789ABCDEF'
DATA9_2 DC X'FEDCBA9876543210'
DATA10_1 DC X'0123456789ABCDEF'
DATA10_2 DC X'FEDCBA9876543210'
DATA11_1 DC X'0123456789ABCDEF'
DATA11_2 DC X'FEDCBA9876543210'
                END
