           START
           USING     *,12
           USING     D@DSECT,11
           USING     C@CSECT,10
           LR        12,15
INST1      LA        1,DATA1
INST2      LA        1,D@DATA1
INST3      LA        1,DATA2
INST4      LA        1,C@DATA1
INST5      LA        1,DATA3
           OFADBGMEM INST1(4),0     
           OFADBGMEM INST2(4),0    
           OFADBGMEM INST3(4),0    
           OFADBGMEM INST4(4),0     
           OFADBGMEM INST5(4),0    
           BR        14
DATA1      DC        CL2'12'
*
D@DSECT    DSECT
D@DATA1    DC        CL2'34'
*
           CSECT
           LA        6,=C'LITERAL#1'
DATA2      DC        CL2'56'
*
C@CSECT    CSECT
           LR        10,15
           LA        7,=C'LITERAL#2'
*
           BR        14
C@DATA1    DC        CL2'78'
*
           CSECT
           LA        8,=C'LITERAL#3'
DATA3      DC        CL2'90'
*
           END       C@CSECT
