O03     CSECT
        LR    12,15
        USING O03,12

        L 2,DATA2

        OFADBGREG 2 

        L 2,DATA2

        O   2,DATA1
        OFADBGREG 2

        L 2,DATA2

        O   2,DATA1
        OFADBGREG 2   

        BR  14
DATA1   DC  XL4'000000FF'
DATA2   DC  XL4'00000005'
        LTORG
        END
 
