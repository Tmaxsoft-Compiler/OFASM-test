LRVG01     CSECT
           LR        12,15
           USING     LRVG01,12
*
           L         2,0(1)
           OFADBGREG 3
           OFADBGMEM 0(0,2),=F'8'
           LRVG      3,0(2)
           OFADBGREG 3
           ST        3,0(2)
*
           L         2,4(1)
           OFADBGREG 3
           OFADBGMEM 0(0,2),=F'8'
           LRVG      3,0(2)
           OFADBGREG 3
           ST        3,0(2)
*
           BR        14
           END
