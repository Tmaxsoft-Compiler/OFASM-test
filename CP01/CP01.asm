CP01       CSECT
R0         EQU       0 
R1         EQU       1
R2         EQU       2
R3         EQU       3
R4         EQU       4
R5         EQU       5
R6         EQU       6
R7         EQU       7
R8         EQU       8
R9         EQU       9
R10        EQU       10
R11        EQU       11
R12        EQU       12
R13        EQU       13
R14        EQU       14
R15        EQU       15
*********************************************************************
           LR        12,15
           USING     CP01,12
*********************************************************************
TEST1      CP        ONE,=P'2'
           BH        HI1
           BE        EQ1
           BL        LO1
HI1        LA        1,WTO#HI
           SVC       35
           B         TEST2
EQ1        LA        1,WTO#EQ
           SVC       35
           B         TEST2
LO1        LA        1,WTO#LO
           SVC       35
           B         TEST2
*********************************************************************
TEST2      CP        TWO,=P'2'
           BH        HI2
           BE        EQ2
           BL        LO2
HI2        LA        1,WTO#HI
           SVC       35
           B         TEST3
EQ2        LA        1,WTO#EQ
           SVC       35
           B         TEST3
LO2        LA        1,WTO#LO
           SVC       35
           B         TEST3
*********************************************************************
TEST3      CP        THREE,=P'2'
           BH        HI3
           BE        EQ3
           BL        LO3
HI3        LA        1,WTO#HI
           SVC       35
           B         END
EQ3        LA        1,WTO#EQ
           SVC       35
           B         END
LO3        LA        1,WTO#LO
           SVC       35
           B         END
*********************************************************************
END        DS        0F
           BR        14
ONE        DC        P'1'
TWO        DC        P'2'
THREE      DC        P'3'
WTO#HI     DC        AL2(8)
           DC        B'0000000000000000'
           DC        CL4'OP1H'
WTO#LO     DC        AL2(8)
           DC        B'0000000000000000'
           DC        CL4'OP1L'
WTO#EQ     DC        AL2(8)
           DC        B'0000000000000000'
           DC        CL4'OP1E'
           END
