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
PKA01       CSECT
           LR        R12,R15
           USING     PKA01,R12
*
           L         R0,ENDCHAR
           PKA  PKDATA01,DATA01(31)
*         OFADBGMEM PKDATA01,=F'16'
*         OFADBGMEM RESULT01,=F'16'
           LA        R3,PKDATA01
           LA        R4,RESULT01
           CLST      R3,R4 
           BNE       NG
           PKA  PKDATA01,DATA01(10)
*         OFADBGMEM PKDATA01,=F'16'
*         OFADBGMEM RESULT02,=F'16'
           LA        R4,RESULT02
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
DATA01     DS 0CL31
           DC X'3132333435'
           DC X'3637383930'
           DC X'3132333435'
           DC X'3637383930'
           DC X'3132333435'
           DC X'3637383930'
           DC X'31'
PKDATA01   DS PL16
END00      DC X'AA'
RESULT01   DC XL16'1234567890123456789012345678901C'
END01      DC X'AA'
RESULT02   DC XL16'0000000000000000000001234567890C'
END02      DC X'AA'
*
           END
