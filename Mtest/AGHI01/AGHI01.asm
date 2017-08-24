AGHI01     CSECT
           LR        12,15          * R15: SUBROUTINE ADDR OF AGHI01
           USING     AGHI01,12      * SET BASE REG AS 12
* -------------------
* PREFARE FOR SVC 35
* -------------------
           LA        1,WTO#L        * STORE ADDR OF WTO#L INTO REG 1
* -------------------
* TEST 1
* -------------------
           LA        2,1            * REG 2 SET BY 1
           AGHI      2,X'0031'      * ...
           ST        2,DATA         * STORE VALUE OF REG 2 INTO DATA
           SVC       35             * CALL WTO
* -------------------
* TEST 2
* -------------------
           LA        2,2            * REG 2 SET BY 2 
           AGHI      2,X'0031'      * ...
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
* DATA FOR AGHI INSTRUCTION
* -------------------
ONE        DC        XL2'0031'      * ASCII (NULL)1 
           END
