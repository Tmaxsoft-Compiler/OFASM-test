L01        CSECT
           LR        12,15
           USING     L01,12
*
           L         2,0(1)
           L         3,0(2)
           OFADBGREG 3
           STG       3,0(2)
*
           L         2,4(1)
           L         3,0(2)
           OFADBGREG 3
           STG       3,0(2)
*
           BR        14
           END
