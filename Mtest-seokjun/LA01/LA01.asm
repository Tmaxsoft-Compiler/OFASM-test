****************************************************************
* FILENAME: LA01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
LA01       CSECT
           LR        12,15
           USING     LA01,12
*
* Result = 0x00000fff
*
           LA        5,4095
           OFADBGREG 5
*
* Result = 0x00000388
*
           LA        5,5000
           OFADBGREG 5
           BR        14
           END
