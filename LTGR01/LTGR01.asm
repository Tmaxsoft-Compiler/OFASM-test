LTGR01     CSECT
           LR        12,15
           USING     LTGR01,12
*
           L         2,0(1)
           LG        3,0(2)
           LTGR      4,3
           ST        4,0(2)
*
           L         2,4(1)
           LG        3,0(2)
           LTGR      4,3
           ST        4,0(2)
*
           BR        14
           END
