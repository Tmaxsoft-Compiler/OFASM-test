JX01        CSECT
           LR        12,15
           USING     JX01,12
           B         TEST1
**********************************************
TEST1      L         2,=F'2'
           L         3,=F'1'
           JXH       2,3,TEST2
           B         END
**********************************************
TEST2      OFADBGREG 2
           L         2,=F'-2'
           L         3,=F'3'
           JXLE      2,3,END
           B         SUB
**********************************************
SUB        S         2,=F'-1'
           B         TEST2
END        DS        0F
           OFADBGREG 2
           BR        14
           END
