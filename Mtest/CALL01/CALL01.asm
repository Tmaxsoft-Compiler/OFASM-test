CALL01   CSECT
         LR     12,15
         USING  CALL01,12
         ST     14,SAVE
         CALL   CALL01_01
         L      14,SAVE
         BR     14
SAVE     DS     F
         END
