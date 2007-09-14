NG03     CSECT
        LR    12,15
        USING NG03,12

        LG 2,DATA1

        OFADBGREG 2 

        LG 2,DATA1

        NG   2,DATA2
        OFADBGREG 2

        LG 2,DATA1

        NG   2,DATA2
        OFADBGREG 2   

        BR  14
DATA1   DC  XL8'00000000000000FF'
DATA2   DC  XL8'000000000000000F'
        LTORG
        END
 
