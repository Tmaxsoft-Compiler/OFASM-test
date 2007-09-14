BXLE01     CSECT
           LR        12,15
           USING     BXLE01,12
*
           L         2,0(1)
           L         3,0(2)
           LA        4,1
           LA        5,0
JUMP1      AR        4,4
           BXLE      3,5,JUMP1
           ST        4,0(2)
*
           L         2,4(1)
           L         3,0(2)
           LA        4,1
           LA        6,1
           LA        7,10
JUMP2      AR        4,4
           SR        7,6
           BXLE      3,6,JUMP2
           ST        4,0(2)
*
           BR        14
           END
