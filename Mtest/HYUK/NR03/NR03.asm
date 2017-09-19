*************************************************
* FILENAME : NR03.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 113
*************************************************
        MACRO
        MAC_NR      &VALUE1,&VALUE2
        L           2,&VALUE1
        L           3,&VALUE2
        NR          2,3
        OFADBGREG   2 
        MEND
NR03    CSECT
        LR          12,15
        USING       NR03,12
* result 0
        MAC_NR      DATA1,=X'01234567'
        MAC_NR      DATA2,=X'0123456789ABCDEF'
        MAC_NR      DATA3,=X'00000000FFFFFFFF'
* result not 0
        MAC_NR      DATA4,=X'00000001'
        MAC_NR      DATA5,=X'1000000000000000'
        MAC_NR      DATA6,=X'FFFFFFFF00000000'
        BR          14
        END
DATA1   DC          X'FEDCBA98'
DATA2   DC          X'FEDCBA98'
DATA3   DC          X'FEDCBA9876543210'
DATA4   DC          X'FFFFFFFF'
DATA5   DC          X'FFFFFFFF'
DATA6   DC          X'FFFFFFFF00000000'
