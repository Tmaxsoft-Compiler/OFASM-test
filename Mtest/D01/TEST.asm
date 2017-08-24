TEST       CSECT             
           LR        12,15
           USING     TEST,12
* --------------------------------------
* TEST 5 : Result : neg*neg => 0x0C46DCE3E3C995BA / 0xD783C4D9
* == 0xB25EC74A ... 0
* --------------------------------------
           L         2,=X'0C46DCE3'
           OFADBGREG 2
           L         3,=X'E3C995BA'
           OFADBGREG 3
           D         2,=X'D783C4D9'
           OFADBGREG 2
           OFADBGREG 3
           BR        14
