BRCT01     CSECT
           LR        12,15
           USING     BRCT01,12
*
           L         2,0(1)
           L         3,0(2)
           LA        4,1
           AR        4,4
           BRCT      3,-2
           ST        4,0(2)
*
           L         2,4(1)
           L         3,0(2)
           LA        4,1
           AR        4,4
           BRCT      3,-2
           ST        4,0(2)
*
           BR        14
           END
