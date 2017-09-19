BOP01   CSECT
        LR    12,15
        USING BOP01,12
        B START

START   L  2,=X'7FFFFFFF'
        A  2,=X'00000001'
        BO NEXT
        B   END

NEXT    OFADBGREG 2
        L  2,=X'7FFFFFFF'
        A  2,=X'00000001'
        LA 3,NEXT2
        BOR 3
        B END

NEXT2   OFADBGREG 2
        L 2,=F'126'
        A 2,=F'1'
        BP NEXT3
        B END

NEXT3   OFADBGREG 2
        L 2,=F'126'
        A 2,=F'1'
        LA 3,END
        BPR 3
        OFADBGREG 3
     
ONE     DC  F'1'
END     EQU *
        OFADBGREG 2
        BR 14
        END
