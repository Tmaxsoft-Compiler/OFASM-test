ABOVE  CSECT
ABOVE  AMODE 31
ABOVE  RMODE 31
       USING *,13
       LR  13,15
       O   14,ADDR
       BSM 0,14
ADDR   DC  A(X'80000000')
       END
