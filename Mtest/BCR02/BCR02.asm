*************************************************
* FILENAME : BCR02.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 113
*************************************************
                MACRO
                MAC_BCR     &VALUE1,&VALUE2,&MASK
                OFADBGMEM   PRINT_STRING+&MASK*7,1
                L           2,&VALUE1
                AH          2,&VALUE2
                OFADBGREG   2
                LA          3,*+4+2+4
                BCR         &MASK,3
                BAS         5,*+4+6+4
                OFADBGMEM   =C'JUMPED',1
                BAS         5,*+10
                OFADBGMEM   =C'NO JUMP',1
                MEND
                MACRO
                MAC_BCR_16  &VALUE1,&VALUE2
                MAC_BCR     &VALUE1,&VALUE2,0
                MAC_BCR     &VALUE1,&VALUE2,1
                MAC_BCR     &VALUE1,&VALUE2,2
                MAC_BCR     &VALUE1,&VALUE2,3
                MAC_BCR     &VALUE1,&VALUE2,4
                MAC_BCR     &VALUE1,&VALUE2,5
                MAC_BCR     &VALUE1,&VALUE2,6
                MAC_BCR     &VALUE1,&VALUE2,7
                MAC_BCR     &VALUE1,&VALUE2,8
                MAC_BCR     &VALUE1,&VALUE2,9
                MAC_BCR     &VALUE1,&VALUE2,10
                MAC_BCR     &VALUE1,&VALUE2,11
                MAC_BCR     &VALUE1,&VALUE2,12
                MAC_BCR     &VALUE1,&VALUE2,13
                MAC_BCR     &VALUE1,&VALUE2,14
                MAC_BCR     &VALUE1,&VALUE2,15
                MEND
BCR02           CSECT
                LR          12,15
                USING       BCR02,12

                MAC_BCR_16  =X'00000000',=X'00000000'
                MAC_BCR_16  =X'FFFFFFFE',=X'00000000'
                MAC_BCR_16  =X'00000001',=X'00000000'
                MAC_BCR_16  =X'7FFFFFFF',=X'7FFF'

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
