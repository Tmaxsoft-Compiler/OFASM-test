OR01       CSECT
           LR        12,15
           USING     OR01,12
           LA        2,32
           LA        3,1
           OFADBGREG 2 
           OFADBGREG 3 
           OR        2,3
           OFADBGREG 2 
           BR        14
           END
