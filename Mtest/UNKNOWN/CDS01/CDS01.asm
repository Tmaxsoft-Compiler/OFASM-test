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
CDS01       CSECT
           LR        R12,R15
           USING     CDS01,R12
*
           LG        R4,DATA01
           LG        R5,DATA02
           LG        R6,DATA03
           LG        R7,DATA04
*
           L         R9,=F'4'
           L         R10,=F'6'
           CDS       R9,R10,RDATA01
           OFADBGMEM RDATA01,LEN01
           BNE       NG 
*
           CDS       R9,R10,RDATA02
           OFADBGREG R4 
           OFADBGREG R5 
           OFADBGREG R6 
           OFADBGREG R7 
           BE        NG 
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
DATA01     DC        XL8'00000000FFFFFFFF'
DATA02     DC        XL8'0000000000000001'
DATA03     DC        XL8'00000000FFFFFFFF'
DATA04     DC        XL8'0000000000000005'
RDATA01    DC        XL8'FFFFFFFF00000001'
RDATA02    DC        XL8'FFFFFFFF00000002'
LEN01      DC        F'8' 
*
           END
