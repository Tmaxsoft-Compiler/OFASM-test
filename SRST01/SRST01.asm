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
SRST01       CSECT
           LR        R12,R15
           USING     SRST01,R12
*
           L         R0,ENDCHAR
*
           LA        R3,DATA02
           LA        R4,DATA01
           SRST      R3,R4 
           BNL       NG
*
           LA        R3,DATA01+10
           LA        R4,DATA01
           SRST      R3,R4 
           BNH       NG
*           
           LA        R3,DATA02
           LA        R4,DATA03
           SRST      R3,R4
           BH        NG
           BE        NG
           BL        NG
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
ENDCHAR    DC        C'123X'
DATA01     DC        C'ABKDJLFSKDJFSFSLKKXFLJAS' 
DATA02     DC        X'C1C2C300'
*
DATA03     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB001     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB002     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB003     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB004     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB005     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB006     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB007     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
*
DATA04     DC        X'00'
*
           END
