LOAD01   CSECT
         USING  LOAD01,15
         OFADBGREG 0
LENTPNT1 LOAD   EPLOC=ENTPNT1
         OFADBGREG 0
         LR     15,0
         LR     13,14
         BALR   14,15
EXIT     BR     13
ENTPNT1	 DC     CL8'LOAD01A'
         END
