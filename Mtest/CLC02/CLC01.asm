****************************************************************
* FILENAME: CLC01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
CLC01      CSECT
           LR        12,15
           USING     CLC01,12
           LA        5,DATA1
           LA        6,DATA3
           OFADBGMEM 0(5,5),0
           OFADBGMEM 0(5,6),0
*
* R5 = HELLO
* R6 = HELLO
* CC = 0
*
           CLC       0(5,5),0(6)
*
* R5 = HELLO
* R6 = WORLD
* CC = 1
*
           LA        6,DATA2
           OFADBGMEM 0(5,6),0
           CLC       0(5,5),0(6)
*
* R5 = HELLO
* R6 = HELLJ
* CC = 2
*
           LA        6,DATA4
           OFADBGMEM 0(5,6),0
           CLC       0(5,5),0(6)
           BR        14
           END
DATA1      DC        CL5'HELLO'
DATA2      DC        CL5'WORLD'
DATA3      DC        CL5'HELLO'
DATA4      DC        CL5'HELLJ'
