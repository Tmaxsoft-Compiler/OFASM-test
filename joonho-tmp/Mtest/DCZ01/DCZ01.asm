DCZ01   CSECT
        LR    12,15
        USING DCZ01,12

        L  2,ZFLD1
        OFADBGREG 2

        L  2,ZFLD2
        OFADBGREG 2

        L  2,ZFLD3
        OFADBGREG 2

        L  2,ZFLD4
        OFADBGREG 2

        LG  2,ZFLD5
        OFADBGREG 2

        BR 14

ZFLD1 DC Z'12345'
ZFLD2 DC ZL6'12345'
ZFLD3 DC ZL4'12345'
ZFLD4 DC Z'1,-2,3'
ZFLD5 DC 2ZL3'125'
        END
