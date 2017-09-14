************************************************
* FILENAME : BCT02.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 113
*************************************************
BCT02           CSECT
                LR          12,15
                USING       BCT02,12
* + -> 0(end)
START_LOOP_P_Z  L           2,=F'2'
LOOP_P_Z        OFADBGMEM   =C'From plus to zero',1
                BCT         2,LOOP_P_Z
* - -> +
START_LOOP_M_P  L           2,=F'-2147483648'
LOOP_M_P        OFADBGMEM   =C'From minus to plus',1
                LR          3,2
                AH          3,=H'0'
                BC          2,START_LOOP_Z_M
                BCT         2,LOOP_M_P
* 0 -> -
START_LOOP_Z_M  L           2,=F'0'
LOOP_Z_M        OFADBGMEM   =C'From zero to minus',1
                LR          3,2
                AH          3,=H'0'
                BC          4,END_OF_CODE
                BCT         2,LOOP_Z_M
END_OF_CODE     BR          14
                END
