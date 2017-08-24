JAS01      CSECT
           LR        12,15
           USING     JAS01,12
*
           L         2,0(1)
           L         3,0(2)
           LA        4,JUMP1
           JAS       3,4
JUMP1      SR        3,4
           ST        3,0(2)
*
           L         2,4(1)
           L         3,0(2)
           LA        4,JUMP2
           JAS       3,4
JUMP2      SR        3,4
           ST        3,0(2)
*
           BR        14
*
           END
