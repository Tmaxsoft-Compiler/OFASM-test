NIHH01      CSECT
           LR        12,15          * R15: SUBROUTINE ADDR OF NIHH01
           USING     NIHH01,12       * SET BASE REG AS 12
* -------------------
* TEST 1
* -------------------
           LG        2,ONE
           OFADBGREG 2
           NIHH      2,X'F00F'      
           OFADBGREG 2
           LG        2,ONE
           OFADBGREG 2
           NILH      2,X'F00F'      
           OFADBGREG 2
           LG        2,ONE
           OFADBGREG 2
           NILL      2,X'F00F'      
           OFADBGREG 2
           LG        2,TWO
           OFADBGREG 2
           OIHH      2,X'F00F'      
           OFADBGREG 2
           LG        2,TWO
           OFADBGREG 2
           OIHL      2,X'F00F'      
           OFADBGREG 2
           LG        2,TWO
           OFADBGREG 2
           OILH      2,X'F00F'      
           OFADBGREG 2
           LG        2,TWO
           OFADBGREG 2
           OILL      2,X'F00F'      
           OFADBGREG 2
* -------------------
* RETURN
* -------------------
           BR        14             * RETURN THE CALLER
* -------------------
* DATA FOR NIHH INSTRUCTION
* -------------------
ONE        DC        XL8'FFFFFFFFFFFFFFFF'      
TWO        DC        XL8'0000000000000000'
           END
