****************************************************************
* FILENAME: MR01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
MR01       CSECT
           LR        12,15
           USING     MR01,12
*
* R7 = 9A * 9A = 5CA4
*
           L         7,DATA2
           MR        6,7
           OFADBGREG 7 
*
* R7 = FFFFFAE5 * FFFFFAE5 = 1A10D9
*
           L         7,DATA3
           MR        6,7
           OFADBGREG 7
           BR        14
DATA2      DC        XL4'9A'
DATA3      DC        XL4'FFFFFAE5'
           END
