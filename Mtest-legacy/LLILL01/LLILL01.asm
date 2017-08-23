LLILL01    CSECT
           LR        12,15
           USING     LLILL01,12
*
           L         2,0(1)
           LLILL     3,X'F1F2F3F4'
           STG       3,0(2)
*
           L         2,4(1)
           LLILL     3,X'01020304'
           STG       3,0(2)
*
           BR        14
           END
