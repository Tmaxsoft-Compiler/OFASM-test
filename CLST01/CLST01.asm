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
CLST01       CSECT
           LR        R12,R15
           USING     CLST01,R12
*
           L         R0,ENDCHAR
           LA        R3,DATA01
           LA        R4,DATA02
           CLST      R3,R4 
           BNE       NG 
*
           LA        R3,DATA03
           LA        R4,DATA04
           CLST      R3,R4 
           BNL       NG 
*
           LA        R3,DATA05
           LA        R4,DATA06
           CLST      R3,R4 
           BNH       NG 
*
           LA        R3,DATA07
           LA        R4,DATA08
           CLST      R3,R4 
           BNL       NG 
*
           LA        R3,DATA09
           LA        R4,DATA10
           CLST      R3,R4 
           BNH       NG 
*
           LA        R3,DATA11
           LA        R4,DATA12
           CLST      R3,R4 
*          BNH       NG 
*
           LA        R3,DATA13
           LA        R4,DATA14
           CLST      R3,R4 
           BNL       NG 
*
           LA        R3,DATA15
           LA        R4,DATA16
           CLST      R3,R4 
           BNH       NG 
*
           LA        R3,DATA17
           LA        R4,DATA18
           CLST      R3,R4 
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
ENDCHAR    DC        XL4'00000000'
DATA01     DC        X'C1C2C300'
DATA02     DC        X'C1C2C300'
*
DATA03     DC        X'C1C2C301'
DATA04     DC        X'C1C2C302'
*
DATA05     DC        X'C1C2C303'
DATA06     DC        X'C1C2C302'
*
DATA07     DC        X'C1C2C300'
DATA08     DC        X'C1C2C302'
*
DATA09     DC        X'C1C2C310'
DATA10     DC        X'C1C20020'
*
DATA11     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB001     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB002     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB003     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB004     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB005     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB006     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB007     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB008     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
DATA12     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB021     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB022     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB023     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB024     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB025     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB026     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB027     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
SUB028     DC        CL32'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
*
DATA13     DC        X'00C2C310'
DATA14     DC        X'C1C2C310'
*
DATA15     DC        X'C1C2C310'
DATA16     DC        X'00C2C310'
*
DATA17     DC        X'00C2C310'
DATA18     DC        X'00C2C310'
           END
