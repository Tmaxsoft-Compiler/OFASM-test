DCP01   CSECT
        LR    12,15
        USING DCP01,12

        L  2,PFLD1
        OFADBGREG 2

        L  2,PFLD2
        OFADBGREG 2

        L  2,PFLD3
        OFADBGREG 2

        L  2,PFLD4
        OFADBGREG 2

        L  2,PFLD5
        OFADBGREG 2

        BR 14

PFLD1 DC P'12345'
PFLD2 DC PL4'12345'
PFLD3 DC PL2'12345'
PFLD4 DC P'1,37,-4892'
PFLD5 DC PL4'39.45'
        END
