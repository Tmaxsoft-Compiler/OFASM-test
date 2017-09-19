JO01       CSECT
           LR        12,15
           USING     JO01,12
           B         TEST1
**********************************************
TEST1      L         1,=X'7FFFFFFF'
           A         1,=X'00000001'
           JO        EQ1
           JNO       HI1
HI1        LA        1,WTO#HI
           B         TEST2
EQ1        LA        1,WTO#EQ
           B         TEST2
**********************************************
            
TEST2      LG        2,0(0,1)
           OFADBGREG 2
           L         1,=F'100'
           A         1,=F'10'
           JO        EQ2
           JNO       HI2
HI2        LA       1,WTO#HI
           B         END
EQ2        LA        1,WTO#EQ
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
WTO#EQ     DC        AL2(8)
           DC        B'0000000000000000'
           DC        CL4'OP1E'
           END
