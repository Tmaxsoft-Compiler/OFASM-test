DCC01   CSECT
        LR    12,15
        USING DCC01,12

        L  2,CFLD1
        OFADBGREG 2

        L  2,CFLD2
        OFADBGREG 2

        L  2,CFLD3
        OFADBGREG 2

        L  2,CFLD4
        OFADBGREG 2
  
        L  2,CFLD4+4
        OFADBGREG 2

        L  2,CFLD5
        OFADBGREG 2

        L  2,CFLD5+4
        OFADBGREG 2

        L  2,CFLD6
        OFADBGREG 2
 
        L  2,CFLD6+4
        OFADBGREG 2

        L  2,CFLD7
        OFADBGREG 2
  
        L  2,CFLD7+4
        OFADBGREG 2

        BR 14

CFLD1 DC C'ABC'
CFLD2 DC CL5'ABC'
CFLD3 DC CL2'ABC'
CFLD4 DC 2C'ABC'
CFLD5 DC 2CL3'ABC'
CFLD6 DC CL10'*'
CFLD7 DC 10C'*'
        END
