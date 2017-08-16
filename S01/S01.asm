S01        CSECT
           LR        12,15
           USING     S01,12
* --------------------------------------
* TEST 1 : Result Zero; no overflow test, CC = 0
* --------------------------------------
           L         3,=F'1'
           OFADBGREG 3
           S         3,=F'1'
           OFADBGREG 3
* --------------------------------------
* TEST 2 : Result less than zero; no overflow, CC = 1
* --------------------------------------
           L         3,=F'0'
           OFADBGREG 3
           S         3,=F'1'
           OFADBGREG 3
* --------------------------------------
* TEST 3 : Result greater than zero; no overflow, CC = 2
* --------------------------------------
           L         3,=F'1'
           OFADBGREG 3
           S         3,=F'-4'
           OFADBGREG 3
* --------------------------------------
* TEST 3 : Overflow, CC = 3
* --------------------------------------
           L         3,=X'7FFFFFFF'
           OFADBGREG 3
           S         3,=F'-1'
           OFADBGREG 3
* --------------------------------------
* TEST 4 : Overflow, CC = 3
* --------------------------------------
           L         3,=X'80000000'
           OFADBGREG 3
           S         3,=X'00000001'
           OFADBGREG 3
* --------------------------------------
* TEST 5 : Result zero; CC = 0
* --------------------------------------
           L         3,=F'-1'
           OFADBGREG 3
           S         3,=F'-1'
           OFADBGREG 3
           BR        14
           END
