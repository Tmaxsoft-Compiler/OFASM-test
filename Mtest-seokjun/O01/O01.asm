****************************************************************
* FILENAME: O01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
O01        CSECT
           LR        12,15
           USING     O01,12
           L         5,=F'5'
*
* Result = 0x0000000000000007, CC = 1
*
           O         5,=F'3'
           OFADBGREG 5
* 
* Result = 0, CC = 0
*
           L         5,=F'0'
           O         5,=F'0'
           OFADBGREG 5
           BR        14
           END
