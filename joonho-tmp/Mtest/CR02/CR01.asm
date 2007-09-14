****************************************************************
* FILENAME: CR01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
CR01       CSECT
           LR        12,15
           USING     CR01,12
*
* First operand = 1232
* Second operand = 1232
* CC = 0
*
           L         5,DATA
           L         6,DATA1
           CR        5,6
           OFADBGREG 5
*
* First operand = 1232
* Second operand = 1233
* CC = 1
*
           L         6,DATA2
           CR        5,6
           OFADBGREG 5
*
* First operand = 1233
* Second operand = 1232
* CC = 2
*
           L         5,DATA2
           L         6,DATA1
           CR        5,6
           OFADBGREG 5
           BR        14
           END
DATA       DC        CL4'1232'
DATA1      DC        CL4'1232'
DATA2      DC        CL4'1233'
