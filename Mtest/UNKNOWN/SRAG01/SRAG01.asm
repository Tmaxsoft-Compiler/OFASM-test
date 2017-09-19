SRAG01      CSECT
           LR        12,15          * R15: SUBROUTINE ADDR OF SRAG01
           USING     SRAG01,12       * SET BASE REG AS 12
* -------------------
* TEST 1
* -------------------
           LG        2,ONE
           L         3,X'02'
           OFADBGREG 4 
           OFADBGREG 2 
           SRAG      4,2,3      
           LG        3,ONE
           OFADBGREG 4 
           OFADBGREG 2 
           LG        2,ONE
           L         3,X'02'
           OFADBGREG 4 
           OFADBGREG 2 
           SRLG      4,2,3      
           LG        3,ONE
           OFADBGREG 4 
           OFADBGREG 2 
           LG        2,ONE
           L         3,X'02'
           OFADBGREG 4 
           OFADBGREG 2 
           RLLG      4,2,16      
           LG        3,ONE
           OFADBGREG 4 
           OFADBGREG 2 
* -------------------
* RETURN
* -------------------
           BR        14             * RETURN THE CALLER
* -------------------
* DATA FOR SRAG INSTRUCTION
* -------------------
ONE        DC        XL8'DDFFFAAFFFFFFF00'      
           END
