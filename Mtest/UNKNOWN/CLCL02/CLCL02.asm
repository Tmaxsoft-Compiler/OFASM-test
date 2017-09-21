CLCL02     CSECT
           LR         12,15
           USING      CLCL02,12
* TEST01
*  compare with operands which have the same length and contents.
           LA         2,SOURCE#01
           LR         6,2
           L          3,LEN#SRC01
           LA         4,TARGET#01
           LR         7,4
           L          5,PAD#LEN01
           CLCL       2,4
* check if cc is set to 0
           BNE        ERROR
* check if even register is set properly, after execution
           A          6,LEN#SRC01
           CR         2,6
           BNE        ERROR
           A          7,LEN#SRC01
           CR         4,7
           BNE        ERROR
* check if odd register is set properly, after execution
           C          3,=F'0'
           BNE        ERROR
           C          5,=F'0'
           BNE        ERROR
* TEST02
*  compare with operands which have the same length and 
*   different contents ( r1 > r2 )
           LA         2,SOURCE#02
           LR         6,2
           L          3,LEN#SRC02
           LA         4,TARGET#02
           LR         7,4
           L          5,PAD#LEN02
           CLCL       2,4
* check if cc is set to 2
           BNH        ERROR
* check if even register is set properly, after execution
           A          6,=F'2'
           CR         2,6
           BNE        ERROR
           A          7,=F'2'
           CR         4,7
           BNE        ERROR
* check if odd register is set properly, after execution
           C          3,=F'2'
           BNE        ERROR
           C          5,=F'2'
           BNE        ERROR
* TEST03
*  compare with operands which have the same length and 
*   different contents ( r1 i < r2 )
           LA         2,SOURCE#03
           LR         6,2
           L          3,LEN#SRC03
           LA         4,TARGET#03
           LR         7,4
           L          5,PAD#LEN03
           CLCL       2,4
* check if cc is set to 1
           BNL        ERROR
* check if even register is set properly, after execution
           A          6,=F'2'
           CR         2,6
           BNE        ERROR
           A          7,=F'2'
           CR         4,7
           BNE        ERROR
* check if odd register is set properly, after execution
           C          3,=F'2'
           BNE        ERROR
           C          5,=F'2'
           BNE        ERROR
SUCCESS    EQU        *
           SR         15,15
           B          END
ERROR      EQU        *
           L          15,=F'1'
           B          END
END        EQU        *
           BR         14
* declare data storage
SOURCE#01  DC         CL4'ABCD'
LEN#SRC01  DC         F'4'
SOURCE#02  DC         CL4'ABCD'
LEN#SRC02  DC         F'4'
SOURCE#03  DC         CL4'AB12'
LEN#SRC03  DC         F'4'
TARGET#01  DC         CL4'ABCD'
PAD#LEN01  DC         XL4'00000004'
TARGET#02  DC         CL4'AB12'
PAD#LEN02  DC         XL4'00000004'
TARGET#03  DC         CL4'ABCD'
PAD#LEN03  DC         XL4'00000004'
           END
