IC01       CSECT
           LR        12,15
           USING     IC01,12
           L         5,=X'12345678'
           IC        5,SOURCE01
           OFADBGREG 5
           C         5,EXPECT01
           BNE       ERROR
           SR        5,5
           IC        5,SOURCE02
           OFADBGREG 5
           C         5,EXPECT02
           BNE       ERROR
           IC        5,SOURCE01
           OFADBGREG 5
           C         5,EXPECT02
           BNE       ERROR
           IC        5,SOURCE03
           OFADBGREG 5
           C         5,EXPECT03
           BE        SUCCESS
ERROR      EQU       *
           L         15,=F'1'
           B         END
SUCCESS    EQU       *
           XR        15,15
           B         END
END        EQU       *
           BR        14
SOURCE01   DC        XL3'FEDCBA'
SOURCE02   DC        XL2'1234'
SOURCE03   DC        XL4'00000000'
EXPECT01   DC        XL4'12FEDCBA'
EXPECT02   DC        XL4'12000034'
EXPECT03   DC        XL4'00000000'
           END
