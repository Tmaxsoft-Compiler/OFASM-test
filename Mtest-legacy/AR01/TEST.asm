TEST       CSECT             
           LR        12,15
           USING     TEST,12
* --------------------------------------
* TEST 2 : Result : 0+(-1) = -1 < 0 ; no overflow, CC = 1
* --------------------------------------
           L         3,=F'0'
           OFADBGREG 3
           L         4,=F'-1'
           OFADBGREG 4
           AR        3,4
           OFADBGREG 3
           BR        14
           END
