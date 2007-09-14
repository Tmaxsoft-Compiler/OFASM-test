TEST       CSECT             
           LR        12,15
           USING     TEST,12
* --------------------------------------
* TEST 1 : PACK DATA
* --------------------------------------
           OFADBGMEM DATA,0
           OFADBGMEM DATA2,0
           OFADBGMEM DATA3,0
           BR        14
           DS        CL256
DATA       DC        S(*)
DATA2      DC        S(*+1)
DATA3      DC        S(DATA)
           END
