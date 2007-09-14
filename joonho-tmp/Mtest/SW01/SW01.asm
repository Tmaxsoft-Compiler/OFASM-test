SW01      CSECT
           LR        12,15          * R15: SUBROUTINE ADDR OF SW01
           USING     SW01,12       * SET BASE REG AS 12
* -------------------
* TEST 1
* -------------------
           LG        2,ONE            * REG 2 SET BY 1
           LG        3,TWO
           OFADBGREG 2
           OFADBGREG 3
           SW        2,TWO            * ...
           OFADBGREG 2
* -------------------
* RETURN
* -------------------
           BR        14             * RETURN THE CALLER
* -------------------
* DATA FOR SW INSTRUCTION
* -------------------
ONE        DC        XL8'7FFFFFFFFFFFFFFF'      
TWO        DC        XL8'800000000FFFFFFF'      
           END
