SUBR01   CSECT
SUBR01   AMODE 31
SUBR01   RMODE 31
         USING *,15
         LR    11,14
         OFADBGMEM OK,1
         BR 11
OK       DC C'OK'
         END
