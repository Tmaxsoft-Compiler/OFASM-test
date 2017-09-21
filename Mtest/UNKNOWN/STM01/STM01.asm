STM01      CSECT
           LR        12,15
           USING     STM01,12
           LM        15,11,DATA#LM
           STM       15,11,DATA#STM
           LA        1,WTO#L
           MVC       WTO#DATA,DATA#STM
           SVC       35
           MVC       WTO#DATA,DATA#STM+4
           SVC       35
           MVC       WTO#DATA,DATA#STM+8
           SVC       35
           MVC       WTO#DATA,DATA#STM+12
           SVC       35
           MVC       WTO#DATA,DATA#STM+16
           SVC       35
           MVC       WTO#DATA,DATA#STM+20
           SVC       35
           MVC       WTO#DATA,DATA#STM+24
           SVC       35
           MVC       WTO#DATA,DATA#STM+28
           SVC       35
           MVC       WTO#DATA,DATA#STM+32
           SVC       35
           MVC       WTO#DATA,DATA#STM+36
           SVC       35
           MVC       WTO#DATA,DATA#STM+40
           SVC       35
           MVC       WTO#DATA,DATA#STM+44
           SVC       35
           BR        14
DATA#LM    DC        CL4'AAAA'
           DC        CL4'BBBB'
           DC        CL4'CCCC'
           DC        CL4'DDDD'
           DC        CL4'EEEE'
           DC        CL4'FFFF'
           DC        CL4'GGGG'
           DC        CL4'HHHH'
           DC        CL4'IIII'
           DC        CL4'JJJJ'
           DC        CL4'KKKK'
           DC        CL4'LLLL'
           DC        CL4'MMMM'
           DC        CL4'NNNN'
           DC        CL4'OOOO'
           DC        CL4'PPPP'
           DC        CL4'QQQQ'
           DC        CL4'RRRR'
DATA#STM   DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
           DC        CL4'    '
WTO#L      DC        AL2(8)
           DC        B'0000000000000000'
WTO#DATA   DC        CL4'    '
           END
