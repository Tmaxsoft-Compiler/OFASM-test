CALLER    CSECT
CALLER    AMODE 31
CALLER    RMODE 31
          USING *,15

          LR    11,14
          LOAD  EP=SUBR01
          LR    15,0
          BAKR  14,15
          BR   11
          END
   

        
