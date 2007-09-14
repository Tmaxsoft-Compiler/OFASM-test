LD01     CSECT
           LR        12,15
           USING     LD01,12
           LD        3,SOURCE
           STD       3,FIELD
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
SOURCE     DC        CL8'ABCDEFGH'
RESULT     DC        CL8'ABCDEFGH'
FIELD      DS        CL8
           END
