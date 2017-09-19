J04     CSECT
        LR    12,15
        USING J04,12
        B START

START   L  2,=F'1'
        C  2,ONE
        JHE NEXT1
        B   END

NEXT1   OFADBGREG 2 
        L  2,=F'0'
        C  2,ONE
        JLE NEXT2 
        B   END

NEXT2   OFADBGREG 2 
        L  2,=F'2'
        C  2,ONE
        JLH NEXT3
        OFADBGREG 3
        B END

NEXT3   OFADBGREG 2
        L   2,=F'0' 
        C   2,ONE
        JNHE NEXT4
        B END

NEXT4   OFADBGREG 2
        L   2,=F'2'
        C   2,ONE
        JNLE NEXT5
        B   END

NEXT5   OFADBGREG 2
        L 2,=F'1'
        C 2,ONE
        JNLH NEXT6
        B END

NEXT6   OFADBGREG 2
        JUMP END
        OFADBGREG 3

ONE     DC  F'1'
END     EQU *
        OFADBGREG 2
        BR 14
        END
