STHY01     CSECT
           LR        12,15
           USING     STHY01,12
           LG        3,SOURCE
           STHY      3,FIELD
*           OFADBGMEM FIELD(0),=F'8'
           CLC       RESULT(2),FIELD
           BE        SUCCESS
ERROR      EQU       *
           L         15,=F'1'
           B         END
SUCCESS    EQU       *
           XR        15,15
           B         END
END        EQU       *
           BR        14
SOURCE     DC        CL8'ABCDEFGH'
RESULT     DC        CL8'GH'
FIELD      DS        CL8
           END
