****************************************************************
* FILENAME: MVC01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
MVC01      CSECT
           LR        12,15
           USING     MVC01,12
           LA        5,DATA
           LA        6,DATA2
           OFADBGMEM 0(4,5),0
           OFADBGMEM 0(4,6),0
*
* R5 = AB34 
* R6 = CD12
* MOVE R5 -> R6
*
           MVC       0(3,6),0(5)
           OFADBGMEM 0(4,5),0
           OFADBGMEM 0(4,6),0
           BR        14
DATA       DC        CL4'AB34' '41423334'
DATA2      DC        CL4'CD12' '43443132'
           END
