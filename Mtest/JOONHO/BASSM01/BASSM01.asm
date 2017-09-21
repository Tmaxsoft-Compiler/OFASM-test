BASSM01    CSECT
           LR        12,15
           USING     BASSM01,12
*
           L         2,0(1)
           L         3,0(2)
           LA        4,JUMP1
           BASSM     3,4
           AH        3,=H'1'
JUMP1      ST        3,4(2)
*
           L         2,4(1)
           L         3,0(2)
           LA        4,JUMP2
           BASSM     3,4
           AH        3,=H'2'
JUMP2      ST        3,4(2)
*
           BR        14
           END
