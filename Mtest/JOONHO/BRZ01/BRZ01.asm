BRZ01     CSECT
        LR    12,15
        USING BRZ01,12
        LA 2,START
        BR 2

START   L  2,=F'2'
        C  2,ONE
        BRC 2,NEXT
        B   END

NEXT    OFADBGREG 2
        L  2,=F'1'
        L  3,=F'2'
        BXH 2,3,NEXT2
        B END

NEXT2   OFADBGREG 2
        L  2,=F'1'
        A  2,=F'-1'
        BZ NEXT3
        OFADBGREG 3
        B END

NEXT3   OFADBGREG 2
        L  2,=F'1'
        A  2,=F'-1'
        LA 3,END
        BZR 3
        OFADBGREG 3
        B END

ONE     DC  F'1'
END     EQU *
        OFADBGREG 2
        BR 14
        END
