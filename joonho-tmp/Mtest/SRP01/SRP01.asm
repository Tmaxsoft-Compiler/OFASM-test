SRP01      CSECT
           LR        12,15          * R15: SUBROUTINE ADDR OF SRP01
           USING     SRP01,12       * SET BASE REG AS 12
* -------------------
* TEST 1
* -------------------
           LA         2,ONE           
           L         3,ONE
           OFADBGREG 3 
           SRP       0(3,2),TWO,X'06'            * ...
           L         3,ONE
           OFADBGREG 3 
* -------------------
* TEST 2
* -------------------
           OFADBGMEM FIELD1,=F'6'
           SRP       FIELD1(6),3,0
           OFADBGMEM FIELD1,=F'6'
* -------------------
* TEST 3
* -------------------
           OFADBGMEM FIELD2,=F'5'
           SRP       FIELD1(5),64-1,0
           OFADBGMEM FIELD2,=F'5'
* -------------------
* TEST 4
* -------------------
           OFADBGMEM FIELD3,=F'4'
           SRP       FIELD3(4),64-3,5
           OFADBGMEM FIELD3,=F'4'
* -------------------
* RETURN
* -------------------
           BR        14             * RETURN THE CALLER
* -------------------
* DATA FOR SRP INSTRUCTION
* -------------------
ONE        DC        XL4'8999567C'      
TWO        DC        XL8'FFFFFFFFFFFFFF3D'      
FIELD1     DC        X'00012345678C'
FIELD2     DC        X'012345678C'
FIELD3     DC        X'1239600D'
           END
