BR01    CSECT
        LR    12,15
        USING BR01,12
        B START

START   L  2,=F'1'
        C  2,ONE
        BRE NEXT1
        B   END

NEXT1   OFADBGREG 2
        L  2,=F'2'
        C  2,ONE
        BRH NEXT2
        B END

NEXT2   OFADBGREG 2
        L  2,=F'0'
        C  2,ONE
        BRNHE NEXT3
        B END

NEXT3   OFADBGREG 2
        L  2,=F'0'
        C  2,ONE
        BRL NEXT4
        B END

NEXT4   OFADBGREG 2
        L  2,=F'1'
        A  2,=F'-3'
        BRM NEXT5
       B END

NEXT5   OFADBGREG 2
        L  2,=F'2'
        C  2,ONE
        BRNE NEXT6
        B END

NEXT6   OFADBGREG 2
        L  2,=F'0'
        C  2,ONE
        BRNH NEXT7
        B END

NEXT7   OFADBGREG 2
        L  2,=F'2'
        C  2,ONE
        BRNL NEXT8
        B END

NEXT8   OFADBGREG 2
        L  2,=F'2'
        C  2,ONE
        BRNLE NEXT9
        B END

NEXT9   OFADBGREG 2
        L  2,=F'1'
        C  2,ONE
        BRNLH NEXT10
       B END

NEXT10  OFADBGREG 2
        L  2,=F'2'
        A  2,=F'1'
        BRNM NEXT11
        B END

NEXT11  OFADBGREG 2
        L  2,=F'2'
        A  2,=F'1'
        BRNO NEXT13
        B END

*NEXT12  OFADBGREG 2
*        L  2,=F'-1'
*        A  2,ONE
*        OFADBGREG 2
*        BRNOP NEXT13
*        B END

NEXT13  OFADBGREG 2
        L  2,=F'2'
        A  2,=F'-4'
        BRNP NEXT14
        B END

NEXT14  OFADBGREG 2
        L  2,=F'2'
        A  2,=F'1'
        BRNZ NEXT15
        B END

NEXT14  OFADBGREG 2
        L    2,=X'FFFFFFFF'
        ALY  2,=X'00000002'
        BRO NEXT15
        B END

NEXT15  OFADBGREG 2
         L  2,=F'2'
         A  2,=F'1'
         BRP NEXT16
         B END

NEXT16  OFADBGREG 2
        L  2,=F'2'
        A  2,=F'2'
        BRU END
        OFADBGREG 3
     
ONE     DC  F'1'
END     EQU *
        OFADBGREG 2
        BR 14
        END
