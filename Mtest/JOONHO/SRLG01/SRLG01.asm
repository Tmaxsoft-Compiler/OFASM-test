SRLG01     CSECT
           LR        12,15          * R15: SUBROUTINE ADDR OF SRLG01
           USING     SRLG01,12       * SET BASE REG AS 12

           LG 3,DATA1
           SRLG 2,3,4
           OFADBGREG 2

           LG 3,DATA2
           SRLG 2,3,32
           OFADBGREG 2

           LG 3,DATA3
           SRLG 2,3,60
           OFADBGREG 2

           LG 3,DATA4
           SRLG 2,3,4
           OFADBGREG 2

           LG 3,DATA5
           SRLG 2,3,32
           OFADBGREG 2

           LG 3,DATA6
           SRLG 2,3,28
           OFADBGREG 2

           LG 3,DATA7
           SRLG 2,3,31
           OFADBGREG 2

           LG 3,DATA8
           SRLG 2,3,-3
           OFADBGREG 2

           BR 14
DATA1      DC   X'7FFFFFFFFFFFFFFF'
DATA2      DC   X'8000000000000000'
DATA3      DC   X'7FFFFFFFFFFFFFFF'
DATA4      DC   X'0FFFFFFFFFFFFFFF'
DATA5      DC   X'00000000FFFFFFFF'
DATA6      DC   X'00000001FFFFFFFF'
DATA7      DC   X'7FFFFFFE00000001'
DATA8      DC   X'1000000000000000'

           END
