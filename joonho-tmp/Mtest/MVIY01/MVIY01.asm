MVIY01     CSECT
           LR        12,15
           USING     MVIY01,12
           MVIY      FIELD,C'X'
*           OFADBGMEM FIELD(0),=F'8'
           CLI       FIELD,C'X'
           BNE       ERROR
SUCCESS    EQU       *
           XR        15,15
           B         END
ERROR      EQU       *
           L         15,=F'1'
           B         END
END        EQU       *
           BR        14
FIELD      DS        CL8
           END
