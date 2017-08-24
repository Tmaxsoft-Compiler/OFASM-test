LGR01      CSECT
           LR        12,15
           LR        11,14
           USING     LGR01,12
*
           L    2,DATA
           L    14,DATA2
           OFADBGREG 2
           OFADBGREG 14
           LA   2,DATA
           LA   3,4
           LA   14,DATA2
           LA   15,4
           MVCL 14,2
           SH   2,=H'4'
           SH   14,=H'4'
           L    2,0(2)
           L    14,0(14)
           OFADBGREG 2
           OFADBGREG 14
*
           BR        11
DATA       DC        X'12345678'
DATA2      DC        X'FFFFFFFF'
           END
