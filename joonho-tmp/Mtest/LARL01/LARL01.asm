LARL01      CSECT
           LR        12,15
           USING     LARL01,12
*
           L         2,0(1)
           LARL      4,14
           LA        5,ADDR1
           B         JUMP1
ADDR1      DC        A(0)
JUMP1      NOP       0,4
           SR        4,5
           ST        4,0(2)
*
           L         2,4(1)
           LARL      4,14
           LA        5,ADDR2
           B         JUMP2
ADDR2      DC        A(0)
JUMP2      SR        4,5
           ST        4,0(2)
*
           BR        14
           END
