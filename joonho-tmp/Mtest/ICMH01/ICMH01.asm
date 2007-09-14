ICMH01     CSECT
           LR        12,15
           USING     ICMH01,12
           LG        5,=X'1234567800000000'
           ICMH       5,B'0111',SOURCE01
* When inserted bits not all zeros & the leftmost bits of storage operand one
* CC = 1
           BC        4,NEXT#01
           B         ERROR
NEXT#01    EQU       *
           OFADBGREG 5
           CG        5,EXPECT01
           BNE       ERROR
           SR        5,5
           ICMH       5,B'1001',SOURCE02
* When inserted bits not all zeros & the leftmost bits of storage operand zero
* CC = 2
           BC        2,NEXT#02
           B         ERROR
NEXT#02    EQU       *
           OFADBGREG 5
           CG        5,EXPECT02
           BNE       ERROR
NEXT#03    EQU       *
           ICMH       5,B'0000',SOURCE01
* when mask is zero, CC == 0
           BC        8,NEXT#04
           B         ERROR
NEXT#04    EQU       *
           OFADBGREG 5
           CG        5,EXPECT02
           BNE       ERROR
           ICMH       5,B'1111',SOURCE03
* When inserted bits all zeors, CC == 0
           BC        8,NEXT#05
NEXT#05    EQU       *
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
EXPECT01   DC        XL8'12FEDCBA00000000'
EXPECT02   DC        XL8'1200003400000000'
EXPECT03   DC        XL8'0000000000000000'
           END
