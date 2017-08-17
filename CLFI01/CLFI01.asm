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
CLFI01     CSECT
           LR        R12,R15
           USING     CLFI01,R12
*
           L        R5,LDATA01
*
*           CLFI      R5,F'1'
           CLFI      R5,X'00000001'
           BNH       NG 
*
*           CLFI      R5,F'2'
           CLFI      R5,X'00000002'
           BNE       NG 
*
*           CLFI      R5,F'3'
           CLFI      R5,X'00000003'
           BNL       NG 
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
LDATA01    DC        F'2'
*
           END
