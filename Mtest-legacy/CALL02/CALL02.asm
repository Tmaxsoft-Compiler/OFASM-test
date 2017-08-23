CALL02   CSECT
         LR     12,15
         USING  CALL02,12
         ST     14,SAVE
         LA     1,PARAMLIST
         CALL   CALL02_01
         L      14,SAVE
         BR     14
SAVE     DS     F
PARAMLIST DC    A(PARAM1+X'80000000')
PARAM1    DC    C'HELLO CALL02_01'
          DC    F'0'
         END
