AH01       CSECT
           LR        12,15
           USING     AH01,12
*
           L         2,0(1)
           L         3,0(2)
           AH        3,=H'1'
           ST        3,0(2)
*
           L         2,4(1)
           L         3,0(2)
           AH        3,=H'1'
           AH        3,=H'1'
           ST        3,0(2)
*
           BR        14
           END
