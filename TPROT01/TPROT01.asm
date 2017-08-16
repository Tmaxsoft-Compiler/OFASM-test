TPROT01    CSECT
           LR        12,15
           USING     TPROT01,12
*
           L         2,0(1)
           LG        3,0(2)
           TPROT     0(0),0(0)
           STG       3,0(2)
*
           L         2,4(1)
           LG        3,0(2)
           TPROT     0(0),0(0)
           STG       3,0(2)
*
           BR        14
           END
