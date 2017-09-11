*************************************************
* FILENAME : BC02.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 113
*************************************************
                MACRO
                MAC_BC      &VALUE1,&VALUE2,&MASK
                OFADBGMEM   PRINT_STRING+&MASK*7,1
                L           2,&VALUE1
                AH          2,&VALUE2
                OFADBGREG   2
                BC          &MASK,*+4+4
                BAS         5,*+4+6+4
                OFADBGMEM   =C'JUMPED',1
                BAS         5,*+10
                OFADBGMEM   =C'NO JUMP',1
                MEND
                MACRO
                MAC_BC_16   &VALUE1,&VALUE2
                MAC_BC      &VALUE1,&VALUE2,0
                MAC_BC      &VALUE1,&VALUE2,1
                MAC_BC      &VALUE1,&VALUE2,2
                MAC_BC      &VALUE1,&VALUE2,3
                MAC_BC      &VALUE1,&VALUE2,4
                MAC_BC      &VALUE1,&VALUE2,5
                MAC_BC      &VALUE1,&VALUE2,6
                MAC_BC      &VALUE1,&VALUE2,7
                MAC_BC      &VALUE1,&VALUE2,8
                MAC_BC      &VALUE1,&VALUE2,9
                MAC_BC      &VALUE1,&VALUE2,10
                MAC_BC      &VALUE1,&VALUE2,11
                MAC_BC      &VALUE1,&VALUE2,12
                MAC_BC      &VALUE1,&VALUE2,13
                MAC_BC      &VALUE1,&VALUE2,14
                MAC_BC      &VALUE1,&VALUE2,15
                MEND
BC02            CSECT
                LR          12,15
                USING       BC02,12

                MAC_BC_16   =X'00000000',=X'00000000'
                MAC_BC_16   =X'FFFFFFFE',=X'00000000'
                MAC_BC_16   =X'00000001',=X'00000000'
                MAC_BC_16   =X'7FFFFFFF',=X'7FFF'

                BR          14
PRINT_STRING    DC          C'MASK=00'
                DC          C'MASK=01'
                DC          C'MASK=02'
                DC          C'MASK=03'
                DC          C'MASK=04'
                DC          C'MASK=05'
                DC          C'MASK=06'
                DC          C'MASK=07'
                DC          C'MASK=08'
                DC          C'MASK=09'
                DC          C'MASK=10'
                DC          C'MASK=11'
                DC          C'MASK=12'
                DC          C'MASK=13'
                DC          C'MASK=14'
                DC          C'MASK=15'
                END 
