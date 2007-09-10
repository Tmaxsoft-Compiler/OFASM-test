JN01       CSECT
           LR        12,15
           USING     JN01,12
           B         TEST1
**********************************************
TEST1      L         1,=F'2'
           C         1,ONE
           JNH        HI1
           JNE        EQ1
           JNL        LO1
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
            
TEST2      LG        2,0(0,1)
           OFADBGREG 2
           L         1,=F'2'
           C         1,TWO
           JNH        HI2
           JNE        EQ2
           JNL        LO2
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
TEST3      LG        2,0(0,1)
           OFADBGREG 2
           L         1,=F'2'
           C         1,THREE
           JNH        HI3
           JNE        EQ3
           JNL        LO3
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
           LG        2,0(0,1)
           OFADBGREG 2
           BR        14
ONE        DC        F'1'
TWO        DC        F'2'
THREE      DC        F'3'
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
