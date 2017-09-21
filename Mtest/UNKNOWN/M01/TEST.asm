TEST       CSECT             
           LR        12,15
           USING     TEST,12
* --------------------------------------
* TEST 3 : Result : 0X93EF7C*0X5813A3==0X32E5AB97AFF4
* --------------------------------------
           L         2,=F'0'
           OFADBGREG 2
           L         3,=X'0093EF7C'
           OFADBGREG 3
           M         2,=X'005813A3'
           OFADBGREG 2
           OFADBGREG 3
           BR        14
           END
