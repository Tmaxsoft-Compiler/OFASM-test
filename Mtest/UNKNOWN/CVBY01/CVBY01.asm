R1       EQU   1                                                        
R2       EQU   2                                                        
R3       EQU   3                                                        
R4       EQU   4                                                        
R5       EQU   5                                                        
R6       EQU   6                                                        
R7       EQU   7                                                        
R8       EQU   8                                                        
R9       EQU   9                                                        
R10      EQU   10                                                       
R11      EQU   11                                                       
R12      EQU   12                                                       
R13      EQU   13                                                       
R14      EQU   14                                                       
R15      EQU   15   
CVBY01       CSECT
           LR        R12,R15
           USING     CVBY01,R12
*
*          L         R5,DATA05
*          OFADBGREG R5
           CVBY      R3,DATA01
           C        R3,DATA02
           BNE       NG 
*
           CVBY      R3,DATA03
           C        R3,DATA04
           BNE       NG 
*           
           BR        R14
*
NG         EQU    *
           L         R2,0(R1)
           L         R3,0(R2)
           AH        R3,=H'1'
           ST        R3,0(R2)
*
           BR        R14
*
*
DATA01     DC        XL8'000000094823456C'
DATA02     DC        XL4'05a6e420'
DATA03     DC        XL8'000000094823456D'
DATA04     DC        XL4'FA591BE0'
DATA05     DC        F'-94823456'
*
           END
