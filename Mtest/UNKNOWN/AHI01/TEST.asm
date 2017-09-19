AHI01      CSECT
           LR        12,15
           USING     AHI01,12
           L         5,DATA1
           AHI       5,H'15'
           OFADBGREG 5
           L         5,DATA2
           AHI       5,H'15'
           OFADBGREG 5
           L         5,DATA2
           AHI       5,H'20'
           OFADBGREG 5
           BR        14
           END
DATA1      DC        H'15'
DATA2      DC        H'-20'
