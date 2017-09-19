MVO03      CSECT
           LR        12,15
           USING     MVO03,12
           MVO   YEAR(5),DATE+1(1)
           LG    2,YEAR
           OFADBGREG 2
           BR 14
YEAR       DC   C'20170112'
DATE       DC   C'17/01/12'
           END
