SH01       CSECT
           LR        12,15
           USING     SH01,12
           LH        2,NINE
           ST        2,DATA
           LA        1,WTO#L
           SVC       35
           SH        2,ONE
           ST        2,DATA
           LA        1,WTO#L
           SVC       35
           BR        14
WTO#L      DC        AL2(19)
           DC        B'0000000000000000'
DATA       DS        XL15
ONE        DC        H'1'
NINE       DC        XL2'0039'
           END
