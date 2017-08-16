TEST       CSECT             
           LR        12,15
           USING     TEST,12
* --------------------------------------
* TEST 1 : PACK DATA
* --------------------------------------
           L         3,DATA
           OFADBGREG 3
           L         3,DATA2
           OFADBGREG 3
           L         3,DATA3
           OFADBGREG 3
           L         3,DATA4
           OFADBGREG 3
           L         3,DATA3+4
           OFADBGREG 3
           L         3,DATA4+4
           OFADBGREG 3
           BR        14
DATA       DC        PL2'049,004'
           DC        X'0000'
DATA2      DC        PL2'049',PL2'004',X'0000'
DATA3      DC        A(0+1,1+2)
DATA4      DC        A(0+1),A(1+2)
           END
