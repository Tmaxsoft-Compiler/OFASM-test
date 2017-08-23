SRP02      CSECT
           LR        12,15          * R15: SUBROUTINE ADDR OF SRP01
           USING     SRP02,12       * SET BASE REG AS 12
* -------------------
* TEST 1
* -------------------
          OFADBGMEM  FIELD1,=F'6'
           SRP       FIELD1(6),3,0
          OFADBGMEM  FIELD1,=F'6'
* -------------------
* TEST 2
* -------------------
          OFADBGMEM  FIELD2,=F'5'
           SRP       FIELD2(5),64-1,0
          OFADBGMEM  FIELD2,=F'5'
* -------------------
* TEST 2
* -------------------
          OFADBGMEM  FIELD3,=F'4'
           SRP       FIELD3(4),64-3,5
          OFADBGMEM  FIELD3,=F'4'
* -------------------
* RETURN
* -------------------
           BR        14             * RETURN THE CALLER
* -------------------
* DATA FOR SRP INSTRUCTION
* -------------------
FIELD1     DC        XL6'00012345678C'
FIELD2     DC        XL5'012345678C'
FIELD3     DC        XL4'1239600D'
           END
