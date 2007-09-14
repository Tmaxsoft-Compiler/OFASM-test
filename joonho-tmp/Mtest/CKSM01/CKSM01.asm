CKSM01     CSECT
           LR        12,15
           USING     CKSM01,12
*
           L         2,0(1)
           L         4,DATA01
           LA        6,DATA02
           LA        7,2
           OFADBGREG 4
           OFADBGREG 6
           CKSM      4,6
           OFADBGREG 4
           OFADBGREG 6
           STG       4,0(2)
*
           L         2,4(1)
           L         4,DATA03
           LA        6,DATA04
           LA        7,512
           OFADBGREG 4
           CKSM      4,6
           OFADBGREG 4
           STG       4,0(2)
*
           BR        14
DATA01     DC        X'11223300'
DATA02     DC        X'00112233'
DATA03     DC        X'11223300'
DATA04     DC        X'00112233'
           END
