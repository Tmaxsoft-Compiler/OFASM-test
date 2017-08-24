BRXH01     CSECT
           LR        12,15
           USING     BRXH01,12
*
           L         2,0(1)
           L         3,0(2)
           LA        4,1
           LA        3,0
           LA        5,0
           AR        4,4
           BRXH      3,5,-2
           ST        4,0(2)
*
           L         2,4(1)
           L         3,0(2)
           LA        4,1
           LA        6,1
           LA        7,10
           AR        4,4
           AR        7,6
           AR        7,6
           BRXH      3,6,-4
           ST        4,0(2)
*
           BR        14
           END
