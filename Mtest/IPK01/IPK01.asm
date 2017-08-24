IPK01      CSECT
           LR        12,15
           USING     IPK01,12
           L         2,=XL4'12abcdef'
           IPK
           OFADBGMEM EXPECT#01(0),=F'4'
           OFADBGREG 2
           C         2,EXPECT#01
           BE        SUCCESS
ERROR      EQU       *
           L         15,=F'1'
           B         END
SUCCESS    EQU       *
           XR        15,15
           B         END
EXPECT#01  DC        XL4'12abcd00'
END        EQU       *
           BR        14
           END
