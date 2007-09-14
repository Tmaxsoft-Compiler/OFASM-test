OIY01      CSECT
           LR        12,15          * R15: SUBROUTINE ADDR OF OIY01
           USING     OIY01,12       * SET BASE REG AS 12
* -------------------
* TEST 1
* -------------------
           LA        2,ONE
           LG        3,ONE
           OFADBGREG 3 
           OIY       0(2),X'0F'      
           LG        3,ONE
           OFADBGREG 3 
* -------------------
* RETURN
* -------------------
           BR        14             * RETURN THE CALLER
* -------------------
* DATA FOR OIY INSTRUCTION
* -------------------
ONE        DC        XL8'0000000000000000'      
           END
