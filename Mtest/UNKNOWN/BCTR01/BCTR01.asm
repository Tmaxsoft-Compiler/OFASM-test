BCTR01          CSECT
                LR          12,15
                USING       BCTR01,12
* + -> 0(end)
START_LOOP_P_Z  L           2,=F'2'
                LA          3,LOOP_P_Z
LOOP_P_Z        OFADBGMEM   =C'From plus to zero',1
                BCTR        2,3
* - -> +
START_LOOP_M_P  L           2,=F'-2147483648'
                LA          3,LOOP_M_P
LOOP_M_P        OFADBGMEM   =C'From minus to plus',1
                LR          4,2
                AH          4,=H'0'
                BC          2,START_LOOP_Z_M
                BCTR        2,3
* 0 -> -
START_LOOP_Z_M  L           2,=F'0'
                LA          3,LOOP_Z_M
LOOP_Z_M        OFADBGMEM   =C'From zero to minus',1
                LR          4,2
                AH          4,=H'0'
                BC          4,END_OF_CODE
                BCTR        2,3
END_OF_CODE     BR          14
                END 
