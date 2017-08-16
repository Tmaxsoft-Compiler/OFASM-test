STY01      CSECT
           LR        12,15
           USING     STY01,12
           L         3,SOURCE
           STY       3,FIELD
           OFADBGMEM FIELD(0),=F'8'
           CLC       RESULT(4),FIELD
           BE        SUCCESS
ERROR      EQU       *
           L         15,=F'1'
           B         END
SUCCESS    EQU       *
           XR        15,15
           B         END
END        EQU       *
           BR        14
RESULT     DC        CL8'ABCDEFGH'
SOURCE     DC        CL8'ABCDEFGH'
FIELD      DS        CL8
           END
