SLG01      CSECT
           LR        12,15          * R15: SUBROUTINE ADDR OF SLG01
           USING     SLG01,12       * SET BASE REG AS 12
* -------------------
* PREFARE FOR SVC 35
* -------------------
           LA        1,WTO#L        * STORE ADDR OF WTO#L INTO REG 1
* -------------------
* TEST 1
* -------------------
           LG        2,ONE            * REG 2 SET BY 1
           LA        3,TWO1
          OFADBGREG 2
          OFADBGREG 3
           SLG       2,TWO1            * ...
          OFADBGREG 2
          OFADBGREG 3
           ST        2,DATA         * STORE VALUE OF REG 2 INTO DATA
           SVC       35             * CALL WTO
* -------------------
* TEST 2
* -------------------
           LG        2,ONE            * REG 2 SET BY 2 
           LA        3,TWO2
           SLG       2,0(0,3)            * ...
          OFADBGREG 2
          OFADBGREG 3
           ST        2,DATA         * STORE VALUE OF REG 2 INTO DATA
           SVC       35             * CALL WTO
* -------------------
* RETURN
* -------------------
           BR        14             * RETURN THE CALLER
* -------------------
* DATA FOR SVC 35
* -------------------
WTO#L      DC        AL2(19)        * MEMORY 2 BYTE SELF-DEF 19
           DC        B'0000000000000000'    * MEMORY 2 BYTE
DATA       DS        XL15           * MEMORY 15 BYTE
* -------------------
* DATA FOR SLG INSTRUCTION
* -------------------
ONE        DC        XL8'11110000000000FF'      
TWO1       DC        XL8'00000000000000FF'      
TWO2       DC        XL8'00000000FFFFFF00'      
           END
