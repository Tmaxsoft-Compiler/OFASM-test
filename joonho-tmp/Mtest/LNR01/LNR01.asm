LNR01      CSECT
           LR        12,15
           USING     LNR01,12
*
           L         2,0(1)
           L         3,0(2)
           OFADBGREG 3
           OFADBGREG 4
           LNR       4,3
           OFADBGREG 4
           ST        4,0(2)
*
           L         2,4(1)
           L         3,0(2)
           OFADBGREG 3
           OFADBGREG 4
           LNR       4,3
           OFADBGREG 4
           ST        4,0(2)
*
           BR        14
           END
