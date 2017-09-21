X03     CSECT
        LR    12,15
        USING X03,12

        L 2,DATA2

        OFADBGREG 2 

        L 2,DATA2

        X   2,DATA1
        OFADBGREG 2

        L 2,DATA2

        X   2,DATA1
        OFADBGREG 2   

        BR  14
DATA1   DC  XL4'00000066'
DATA2   DC  XL4'0000007A'
        LTORG
        END
 
