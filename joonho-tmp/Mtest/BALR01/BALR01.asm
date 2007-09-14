BALR01  CSECT
        LR    12,15
        USING BALR01,12

        LA        3,MAIN
        BALR      9,3

MAIN    L         2,=F'1'
        BAL       9,CAL
        BAL       9,DISPLAY

CAL     A         2,=F'2'
        ST        2,RESULT
        BR        9
        

DISPLAY L         4,RESULT
        OFADBGREG 4
        BR        14

RESULT  DC  F'0'
        END
