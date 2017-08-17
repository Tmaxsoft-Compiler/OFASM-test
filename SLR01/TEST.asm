TEST       CSECT             
           LR        12,15
           USING     TEST,12
* --------------------------------------
* TEST 1 : not zero, no borrow, CC = 3
* --------------------------------------
           L         3,=X'FFFFFFFF'
           L         4,=X'00000002'
           SLR       3,4
           OFADBGREG 3
* --------------------------------------
* TEST 1 : zero, no borrow, CC = 2
* --------------------------------------
           L         3,=F'-1'
           L         4,=F'-1'
           SLR       3,4
           OFADBGREG 3
* --------------------------------------
* TEST 2 : not zero, borrow CC: 1
* --------------------------------------
           L         3,=F'8'
           L         4,=F'9'
           SLR       3,4
           OFADBGREG 3
           BR        14
           END
