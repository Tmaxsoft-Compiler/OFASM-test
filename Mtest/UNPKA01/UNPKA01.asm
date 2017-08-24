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
UNPKA01       CSECT
           LR        R12,R15
           USING     UNPKA01,R12
*
           L         R0,ENDCHAR
*
           UNPKA       DATA01(31),PKDATA01
           LA        R3,DATA01
           LA        R4,RESULT01
           CLST      R3,R4 
           BNE       NG
*
           UNPKA       DATA02(8),PKDATA01
           LA        R3,DATA01
           LA        R4,RESULT01
           CLST      R3,R4 
           BNE       NG
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
ENDCHAR    DC        XL4'AAAAAAAA'
DATA01     DS CL31
END00      DC X'AA'
DATA02     DS CL31
END00      DC X'AA'
PKDATA01   DS 0PL16
           DC X'1234567890'
           DC X'1234567890'
           DC X'1234567890'
           DC X'1C'
END01      DC X'AA'
RESULT01   DS 0CL31
           DC X'3132333435'
           DC X'3637383930'
           DC X'3132333435'
           DC X'3637383930'
           DC X'3132333435'
           DC X'3637383930'
           DC X'31'
END02      DC X'AA'
RESULT02   DC X'3435363738393031'
END03      DC X'AA'
*
           END
