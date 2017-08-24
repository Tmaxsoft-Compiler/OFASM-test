DP01    CSECT
        LR          12,15
        USING       DP01,12 
        LA          2,DATA1
        LA          3,DATA2
        DP          DATA1,DATA2
        DP          DATA1,DATA2
        DP          DATA1,DATA2
        DP          DATA1,DATA2
        DP          DATA1,DATA2
*        DP          0(5,2),0(2,3)
        DP          DATA1,DATA2
        L           4,DATA1
        OFADBGREG   4
        L           4,DATA1+1
        OFADBGREG   4
        BR          14
*
DATA1   DC          PL5'012345678'
DATA2   DC          PL2'-321'
        END
