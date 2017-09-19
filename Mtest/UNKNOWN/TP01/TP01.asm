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
TP01       CSECT
           LR        R12,R15
           USING     TP01,R12
*
           TP        DATA01(8)
           BNE       NG 
*
           TP        DATA02(8)
           BNL       NG 
*           
           TP        DATA03(8)
           BNH       NG 
*
           TP        DATA04(8)
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
DATA01     DC        XL8'000249294823456C'
DATA02     DC        XL8'000249294823456X'
DATA03     DC        XL8'00024929482F451D'
DATA04     DC        XL8'00024E29482F4514'
LEN01      DC        F'8'
*
           END
