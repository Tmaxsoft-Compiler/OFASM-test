S01        CSECT
           LR        12,15
           USING     S01,12
           L         13,DATA
           ST        13,WTO#DATA
           LA        1,WTO#L
           SVC       34
           S         13,=F'1'
           ST        13,WTO#DATA
           SVC       35
           BR        14
DATA       DC        XL4'20202031'
WTO#L      DC        AL2(8)
           DC        B'0000000000000000'
WTO#DATA   DC        CL4'    '
           END
