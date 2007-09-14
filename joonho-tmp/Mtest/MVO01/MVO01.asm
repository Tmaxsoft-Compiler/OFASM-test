MVO01      CSECT
           LR        12,15
           USING     MVO01,12
*
           MVO   TEST1(4),TEST2(3)
           L     2,TEST1
           OFADBGREG 2
           LG    2,0

           MVO   YEAR(5),WDATE+1(1)
           LG    2,YEAR
           OFADBGREG 2


           BR 14

YEAR       DC    PL5'0'                                                   00077
WDATE      DC    XL4'0017011F'                                            00080

TEST1      DC    XL4'7788990C'
TEST2      DC    XL3'123456'
           END
