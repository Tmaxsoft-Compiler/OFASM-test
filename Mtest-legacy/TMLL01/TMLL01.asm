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
TMLL01       CSECT
           LR        R12,R15
           USING     TMLL01,R12
*
           L         R5,DATA01
           TMLL      R5,B'0000111000001100'
           BNE       NG 
*
           TMLL      R5,B'0000111011101101'
           BNL       NG 
*
           TMLL      R5,B'0100111001101100'
           BNH       NG 
*
           TMLL      R5,B'1110000011100000'
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
DATA01     DC        B'11111111111111111111000011110001' 
MASK00     DC        B'0000111000001100'
MASK01     DC        B'0000111011101101'
MASK02     DC        B'0100111001101100'
MASK03     DC        B'1110000011100000'
*
           END
