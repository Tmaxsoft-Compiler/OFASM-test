R0        EQU       0 
R1        EQU       1
R2        EQU       2
R3        EQU       3
R4        EQU       4
R5        EQU       5
R6        EQU       6
R7        EQU       7
R8        EQU       8
R9        EQU       9
R10       EQU       10
R11       EQU       11
R12       EQU       12
R13       EQU       13
R14       EQU       14
R15       EQU       15
SVC56     CSECT
          LR        12,15
          USING     SVC56,12
          LA        4,PLIST                                             00012100
          ST        4,QELL                                              00012200
          L         1,QELL                                               00020400
          XC        RNAME(250),RNAME                                    00012300
          XC        RNAME+250(250),RNAME+250                            00012400
          MVC       0(8,4),CONST                                        00014100
          MVC       0(1,4),CONSTEND                                     00014100
          ENQ       ,MF=(E,(1))                                          00020500
          DEQ       ,MF=(E,(1))                                          00020500
          BR        14
*
PLIST     DS        10XL12                                              00017000
CONST     DS        0A                                                  00015800* CONST = PLIST entry
          DC        AL1(64)                                             00015900* 1 (SHARED REQUEST)
          DC        AL1(50)                                             00016000* 2 (LENGTH OF MINORNAME)
          DC        BL1'01000000'                                       00016100* 3 (SCOPE IS SYSTEM)
          DC        AL1(0)                                              00016200* 4 (RETURN CODE BY ENQ)
          DC        A(QNAME)                                            00016300* 8 (ADDR OF QNAME)
          DC        A(RNAME)                                            00016400* 12 (ADDR OF RNAME)
CONSTEND  DC        AL1(192)                                            00016500
          CNOP      0,4                                                 00016600
QNAME     DC        CL8'FACOM-85'                                       00016700
RNAME     DC        10CL50'123'                                         00016800
QELL      DS        A
*********************************************************************
* END OF PROGRAM
*********************************************************************
         END
