DCX01   CSECT
        LR    12,15
        USING DCX01,12

        L  2,XFLD1
        OFADBGREG 2

        L  2,XFLD2
        OFADBGREG 2

        L  2,XFLD5
        OFADBGREG 2

        LG  2,XFLD6
        OFADBGREG 2

        L  2,XFLD7
        OFADBGREG 2

        BR 14

XFLD1 DC X'3C'
XFLD2 DC XL3'3C2F4C'
XFLD5 DC 2X'3F'
XFLD6 DC 3XL3'123456'
XFLD7 DC X'AB,CD'
      LTORG
        END
