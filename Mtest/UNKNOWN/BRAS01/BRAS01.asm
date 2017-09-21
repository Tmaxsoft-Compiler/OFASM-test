BRAS01     CSECT
           LR        12,15
           USING     BRAS01,12
*
           L         2,0(1)
           L         3,0(2)
           LA        4,JUMP1
           BRAS      3,2
           AH        3,=H'100'  * THIS INSTRUCTION SHOULD BE IGNORED
JUMP1      SR        3,4
           ST        3,0(2)
*
           L         2,4(1)
           L         3,0(2)
           LA        4,JUMP2
           BRAS      3,2
           AH        3,=H'100'  * THIS INSTRUCTION SHOULD BE IGNORED
JUMP2      SR        3,4
           ST        3,0(2)
*
           BR        14
           END
