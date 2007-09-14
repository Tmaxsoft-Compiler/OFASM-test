* commenct
*  NOP modified to a BR instruction in an action self-modifying code
*
NOP01     CSECT
           LR        12,15
           USING     NOP01,12
TEST       NOP       SUCCESS
           MVI       TEST+1,X'F0'
ERROR      EQU       *
           L         15,=F'1'
           B         END
SUCCESS    EQU       *
           XR        15,15
           B         END
END        EQU       *
           BR        14
           END
