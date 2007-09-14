B02     CSECT
        LR    12,15
        USING B02,12
        B START

START   L  2,=F'1'
        C  2,ONE
        LA 3,NEXT
        BER 3
        B   END

NEXT    OFADBGREG 2 
        L  2,=F'2'
        C  2,ONE
        BHE NEXT2 
        B   END

NEXT2   OFADBGREG 2 
        L  2,=F'2'
        C  2,ONE
        LA 3,NEXT3 
        BHER 3
        B END

NEXT3   OFADBGREG 2
        L   2,=F'3' 
        C   2,ONE
        LA  3,NEXT4
        BHR 3
        B END

NEXT4   OFADBGREG 2
        L   2,=F'1'
        C   2,ONE
        BLE NEXT5
        B   END

NEXT5   OFADBGREG 2
        L 2,=F'1'
        C 2,ONE
        LA 3,NEXT6
        BLER 3
        B END

NEXT6   OFADBGREG 2
        L 2,=F'3'
        C 2,ONE
        BLH NEXT7 
        B END

NEXT7   OFADBGREG 2
        L 2,=F'1'
        C 2,ONE
        LA 3,NEXT8
        BLER 3
        B END

NEXT8   OFADBGREG 2
        L 2,=F'4'
        C 2,ONE
        LA 3,NEXT9
        BLHR 3
        B END

NEXT9   OFADBGREG 2
        L 2,=F'0'
        C 2,ONE
        LA 3,END
        BLR 3
        OFADBGREG 3
     
ONE     DC  F'1'
END     EQU *
        OFADBGREG 2
        BR 14
        END
