R0       EQU   0                                                        
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
SPM01       CSECT
           LR        R12,R15
           USING     SPM01,R12
*
           L         R1,DATA01
           SPM  R1,R2 
           BNE       NG
*
           L         R1,DATA02
           SPM  R1,R2 
           BNL       NG
*
           L         R1,DATA03
           SPM  R1,R2 
           BNH       NG
*
           L         R1,DATA04
           SPM  R1,R2 
           BH       NG
           BE       NG
           BL       NG
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
DATA01     DC X'01000000'
DATA02     DC X'12000000'
DATA03     DC X'23000000'
DATA04     DC X'34000000'
*
           END
