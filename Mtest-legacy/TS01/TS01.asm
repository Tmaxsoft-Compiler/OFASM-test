TS01        CSECT
            LR          12,15
            USING       TS01,12
            L           2,=F'0'
            TS          DATA1
            OFADBGMEM   DATA1,0
            OFADBGREG   2
            TS          DATA2
            OFADBGMEM   DATA2,0
            OFADBGREG   2
            BR          14
DATA1       DC          XL4'0000DDDD'
DATA2       DC          XL4'8000FFFF'
            END
