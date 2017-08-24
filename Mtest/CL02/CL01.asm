****************************************************************
* FILENAME: CL01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
CL01       CSECT
           LR        12,15
           USING     CL01,12
*
* First operand = 1232
* Second operand = 1232
* CC = 0
*
           L         5,DATA
           CL        5,=CL4'1232'
           OFADBGREG 5
*
* First operand = 1232
* Second operand = 1233
* CC = 1
* 
           CL        5,=CL4'1233'
           OFADBGREG 5
*
* First operand = 1233
* Second operand = 1232
* CC = 2
*
           L         5,=CL4'1233'
           CL        5,DATA
           OFADBGREG 5
           BR        14
           END
DATA       DC        CL4'1232'
