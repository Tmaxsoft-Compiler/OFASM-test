CLCL03     CSECT
           LR         12,15
           USING      CLCL03,12
           LA         2,SOURCE#01
           LR         6,2
           L          3,LEN#SRC01
           LA         4,TARGET#01
           LR         7,4
           L          5,PAD#LEN01
           CLCL       2,4
           BNH        ERROR
* check if register set properly, after execution
           A          6,=F'5'
           CR         2,6
           BNE        ERROR
           A          7,=F'5'
           CR         4,7
           BNE        ERROR
* check if odd register is set properly, after execution
           C          3,=F'5'
           BNE        ERROR
           C          5,=F'0'
           BNE        ERROR
           LA         2,SOURCE#02
           LR         6,2
           L          3,LEN#SRC02
           LA         4,TARGET#02
           LR         7,4
           L          5,PAD#LEN02
           CLCL       2,4
           BNE        ERROR
* check if register set properly, after execution
           A          6,=F'10'
           CR         2,6
           BNE        ERROR
           A          7,=F'5'
           CR         4,7
           BNE        ERROR
* check if odd register is set properly, after execution
           C          3,=F'0'
           BNE        ERROR
           C          5,=F'0'
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
SOURCE#01  DC         CL10'1234567890'
LEN#SRC01  DC         F'10'
TARGET#01  DC         CL5'12345'
PAD#LEN01  DC         X'00000005'
SOURCE#02  DC         CL10'12345     '
LEN#SRC02  DC         F'10'
TARGET#02  DC         CL5'12345'
PAD#LEN02  DC         X'20000005'
          END
