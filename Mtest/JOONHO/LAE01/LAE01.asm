LAE01        CSECT
           LR        12,15
           USING     LAE01,12
*
           LAE        2,0(1)
           L        3,0(2)
           STG       3,0(2)
*
           LAE        2,4(1)
           L        3,0(2)
           STG       3,0(2)
*
           BR        14
           END
