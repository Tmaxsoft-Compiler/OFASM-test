A01        CSECT
           LR        12,15
           USING     A01,12
* --------------------------------------
* TEST 1 : Result Zero; no overflow test, CC = 0
* --------------------------------------
           L         2,0(1)         *
           L         3,0(2)
           OFADBGREG 3
           A         3,=F'-1'
           OFADBGREG 3
           ST        3,0(2)
* --------------------------------------
* TEST 2 : Result less than zero; no overflow, CC = 1
* --------------------------------------
           L         2,4(1)
           L         3,0(2)
           OFADBGREG 3
           A         3,=F'-1'
           OFADBGREG 3
           ST        3,0(2)
* --------------------------------------
* TEST 3 : Result greater than zero; no overflow, CC = 2
* --------------------------------------
           L         2,8(1)
           L         3,0(2)
           OFADBGREG 3
           A         3,=F'4'
           OFADBGREG 3
           ST        3,0(2)
* --------------------------------------
* TEST 3 : Overflow, CC = 3
* --------------------------------------
           L         2,12(1)
           L         3,0(2)
           OFADBGREG 3
           A         3,=F'1'
           OFADBGREG 3
           ST        3,0(2)
           BR        14
           END
