N03     CSECT
        LR    12,15
        USING N03,12

        L 2,DATA1

        OFADBGREG 2 

        N   2,DATA2
        OFADBGREG 2

        L 2,DATA1

        N   2,DATA2
        OFADBGREG 2   

        BR  14
DATA1   DC  XL4'000000FF'
DATA2   DC  XL4'0000000F'
        LTORG
        END
 
