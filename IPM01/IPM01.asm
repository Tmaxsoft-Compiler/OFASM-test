IPM01      CSECT
           LR        12,15
           USING     IPM01,12
           L         2,=F'1'
           L         3,=F'10'
           L         5,SRC#01
           CR        2,2
           IPM       5
           C         5,EXPECT#01
           OFADBGMEM EXPECT#01(0),=F'4'
           OFADBGREG 5
           BNE       ERROR
           CR        2,3
           IPM       5
           C         5,EXPECT#02
           OFADBGMEM EXPECT#02(0),=F'4'
           OFADBGREG 5
           BNE       ERROR
           CR        3,2
           IPM       5
           C         5,EXPECT#03
           OFADBGMEM EXPECT#03(0),=F'4'
           OFADBGREG 5
           BNE       ERROR
           B         SUCCESS
ERROR      EQU       *
           L         15,=F'1'
           B         END
SUCCESS    EQU       *
           XR        15,15
           B         END
END        EQU       *
           BR        14
SRC#01     DC        X'12345678'
EXPECT#01  DC        X'00345678'
EXPECT#02  DC        X'10345678'
EXPECT#03  DC        X'20345678'
           END
