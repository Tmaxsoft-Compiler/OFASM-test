BAL01   CSECT
        LR    12,15
        USING BAL01,12

        BAL 9,MAIN

MAIN    L         2,=F'1'
        BAL       9,CAL
        BAL       9,DISPLAY

DISPLAY L         4,RESULT
        OFADBGREG 4
        BR        14

CAL     A         2,=F'2'
        ST        2,RESULT
        BR        9

RESULT  DC  F'0'
        END
