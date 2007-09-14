CH01       CSECT
           LR        12,15
           USING     CH01,12
           B         TEST1
**********************************************
TEST1      L         1,=H'2'
           CH        1,ONE
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
**********************************************
            
TEST2      L         1,=H'2'
           CH        1,TWO
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
**********************************************
TEST3      L         1,=H'2'
           CH        1,THREE
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
**********************************************
END        DS        0F
           BR        14
ONE        DC        H'1'
TWO        DC        H'2'
THREE      DC        H'3'
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
