MVST01     CSECT
           LR        12,15
           USING     MVST01,12
           LA        3,SOURCE01
           LA        4,TARGET01
           SR        0,0
LOOP#01    MVST      4,3
           BC        1,LOOP#01
           OFADBGMEM TARGET01(0),=F'9'
           CLC       SOURCE01(9),TARGET01
           BNE       ERROR
           LA        3,SOURCE02
           LA        4,TARGET02
           LG        0,=X'0000000000000023'
LOOP#02    MVST      4,3
           BC        1,LOOP#02
           OFADBGMEM TARGET02(0),=F'10'
           CLC       SOURCE02(5),TARGET02
           BNE       ERROR
SUCCESS    EQU       *
           XR        15,15
           B         END
ERROR      EQU       *
           L         15,=F'1'
           B         END
END        EQU       *
           BR        14
SOURCE01   DC        CL8'ABCDEFGH'
           DC        X'00'
SOURCE02   DC        CL8'ABCD#FGH'
TARGET01   DS        CL10
TARGET02   DS        CL10
           END
