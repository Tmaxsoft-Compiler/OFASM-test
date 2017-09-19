BSM01      CSECT
           LR        12,15
           USING     BSM01,12
*
           L         2,0(1)
           L         3,0(2)
           LA        6,JUMP1
           ST        3,0(2)
           OFADBGREG 3
           BSM       3,6
JUMP1      ST        3,0(2)
           OFADBGREG 3
*
           L         2,4(1)
           L         3,0(2)
           LA        6,JUMP2
           OFADBGREG 6
           O         6,DATA
           OFADBGREG 6
           OFADBGREG 3
           BSM       3,6
JUMP2      ST        3,0(2)
           OFADBGREG 3
*
           BR        14
DATA       DC        XL4'80000000'
           END
