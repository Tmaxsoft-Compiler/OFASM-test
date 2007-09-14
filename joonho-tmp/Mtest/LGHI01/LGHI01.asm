LGHI01     CSECT
           LR        12,15
           USING     LGHI01,12
*
           L         2,0(1)
           LGHI      3,X'FFFF'
           ST        3,0(2)
*
           L         2,4(1)
           LGHI      3,X'FFFFFF00'
           ST        3,0(2)
*
           BR        14
           END
