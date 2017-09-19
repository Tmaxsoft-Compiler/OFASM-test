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
CGHI01     CSECT
           LR        R12,R15
           USING     CGHI01,R12
*
           LG        R5,LDATA01
*
*           CGHI      R5,H'1'
           CGHI      R5,X'0001'
           BNH       NG 
*
*           CGHI      R5,H'2'
           CGHI      R5,X'0002'
           BNE       NG 
*
*           CGHI      R5,H'3'
           CGHI      R5,X'0003'
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
LDATA01    DC        XL8'0000000000000002'
*
           END
