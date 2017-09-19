LLH01      CSECT
           LR        12,15
           USING     LLH01,12
*
           L         2,0(1)
           LLH       3,0(2)
           STG       3,0(2)
*
           L         2,4(1)
           LLH       3,0(2)
           STG       3,0(2)
*
           BR        14
           END
