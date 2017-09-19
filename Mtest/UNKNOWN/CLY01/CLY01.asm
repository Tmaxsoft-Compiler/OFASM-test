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
CLY01       CSECT
           LR        R12,R15
           USING     CLY01,R12
*
           L        R5,DATA02
*
           CLY        R5,DATA01
           BNH       NG 
*
           CLY        R5,DATA02
           BNE       NG 
*
           CLY        R5,DATA03
           BNL       NG 
*
           L         R5,DATA05
*
           CLY        R5,DATA04
           BNL       NG 
*
           CLY        R5,DATA05
           BNE       NG 
*
           CLY        R5,DATA06
           BNH       NG 
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
DATA01     DC        XL4'0000FF01'
DATA02     DC        XL4'0000FF02'
DATA03     DC        XL4'0000FF03'
DATA04     DC        XL4'FFFFFFFF'
DATA05     DC        XL4'FFFFFFFE'
DATA06     DC        XL4'FFFFFFFD'
*
           END
