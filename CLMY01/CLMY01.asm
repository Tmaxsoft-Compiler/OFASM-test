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
CLMY01       CSECT
           LR        R12,R15
           USING     CLMY01,R12
*
*
           L         R6,DATA01
           LA        R11,DATA02
           CLMY      R6,B'1101',0(R11)
           BNH       NG 
*
           CLMY      R6,B'1101',3(R11)
           BNE       NG 
*
           CLMY      R6,B'1101',6(R11)
           BNL       NG 
*
           BR        R14
NG         EQU    *
           L         R2,0(R1)
           L         R3,0(R2)
           AH        R3,=H'1'
           ST        R3,0(R2)
*
           BR        R14
*
DATA01     DC        XL4'F0BC5C7B'
DATA02     DC        XL3'F0BC71'
DATA03     DC        XL3'F0BC7B'
DATA04     DC        XL3'F0BC7D'
*
           END
