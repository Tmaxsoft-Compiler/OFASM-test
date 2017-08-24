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
TMY01       CSECT
           LR        R12,R15
           USING     TMY01,R12
*
           TMY       DATA01,B'00000100'
           BNE       NG 
*
           TMY       DATA01,B'10100101'
           BNL       NG 
*
           LA        R2,DATA01
           TMY       0(R2),B'11000011'
           BE        NG 
           BL        NG 
           BH        NG 
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
DATA01     DC        B'11111011' 
MASK00     DC        B'00000100'
MASK01     DC        B'10100101'
MASK03     DC        B'11000011'
*
           END
