TEST       CSECT             
           LR        12,15
           USING     TEST,12
* --------------------------------------
* TEST 1 : PACK DATA
* --------------------------------------
           OFADBGREG 105
           LA        5,1
           LA        5,2
           BR        14
           DS        CL256
DATA       DC        S(*)
DATA2      DC        S(*+1)
DATA3      DC        S(DATA)
           END
