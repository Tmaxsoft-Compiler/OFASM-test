MVCL02     CSECT
           LR         12,15
           USING      MVCL02,12
*
* TEST CASE01
*  move the location of the second operand to it of the first operand 
*   by the same length.
TEST#01    LA         2,SOURCE#01
           LR         6,2
           L          3,PAD#LEN01
           LA         4,TARGET#01
           LR         7,4
           L          5,LEN#TAR01
           MVCL       4,2
* check if condition code is zero
           BNZ        ERROR
* check if even register set properly after execution, 
           A          6,LEN#TAR01
           CR         2,6
           BNE        ERROR
           A          7,LEN#TAR01
           CR         4,7
           BNE        ERROR
* check if odd register decreased by number of moved bytes
           C          3,=F'0'
           BNE        ERROR
           C          5,=F'0'
* check if second operand is copied at the first-operand location properly.
           CLC        TARGET#01(10),RESULT#01
           BNE        ERROR
*
* TEST CASE02
*  the second operand placed at the first-opernad location.
*  the length of 1st. > the length of 2nd. 
*  The remaining rightmost byte positions of the 1st-operand location 
*   filled with padding bytes (space)
TEST#02    LA         4,TARGET#02
           L          5,LEN#TAR02
           LR         7,4
           LA         2,SOURCE#02
           L          3,PAD#LEN02
           LR         6,2
           MVCL       4,2
* check if condition code is 2
           BNH        ERROR
           CLC        TARGET#02(15),RESULT#02
           BNE        ERROR
* check if even register set properly after execution
           A          6,=F'5'
           CR         2,6
           BNE        ERROR
           A          7,LEN#TAR02
           CR         4,7
           BNE        ERROR
* check if odd register decreased by number of moved bytes
           C          3,=F'0'
           BNE        ERROR
           C          5,=F'0'
* check if second operand is copied at the first-operand location properly.
           CLC        TARGET#02(10),RESULT#02
           BNE        ERROR
*
* TEST CASE03
*  the second operand placed at the first-opernad location.
*  the length of 1st. < the length of 2nd. 
*  The remaining byte of the 2nd-operand location is truncated
TEST#03    LA         2,SOURCE#03
           LR         6,2
           L          3,PAD#LEN03
           LA         4,TARGET#03
           LR         7,4
           L          5,LEN#TAR03
           MVCL       4,2
* check if condition code is ??
           BNL        ERROR
* check if even register set properly after execution, 
           A          6,LEN#TAR03
           CR         2,6
           BNE        ERROR
           A          7,LEN#TAR03
           CR         4,7
           BNE        ERROR
* check if odd register decreased by number of moved bytes
           C          3,=F'5'
           BNE        ERROR
           C          5,=F'0'
           BNE        ERROR
* check if second operand is copied at the first-operand location properly.
           CLC        TARGET#03(5),SOURCE#03
           BNE        ERROR
SUCCESS    EQU        *
           SR         15,15
           B          END
ERROR      EQU        *
           L          15,=F'1'
           B          END
END        EQU        *
           BR         14
TEST#DAT1  DS         0D
LEN#TAR01  DC         F'10'
LEN#TAR02  DC         F'15'
LEN#TAR03  DC         F'5'
SOURCE#01  DC         CL10'1234567890'
SOURCE#02  DC         CL5'12345'
SOURCE#03  DC         CL5'ABCDEFGHIJK'
PAD#LEN01  DC         X'0000000A'
PAD#LEN02  DC         X'20000005'
PAD#LEN03  DC         X'2000000A'
TARGET#01  DS         CL16
TARGET#02  DS         CL15
TARGET#03  DS         CL10
RESULT#01  DC         CL10'1234567890'
RESULT#02  DC         CL15'12345          '
RESULT#03  DC         CL5'12345'
           END
