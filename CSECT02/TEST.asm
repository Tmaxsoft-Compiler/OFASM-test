TEST       CSECT             
D@TEST     DSECT
D@DATA     DS        CL4
           CSECT
           USING     *,12
           LR        12,15
           LA        11,DATA
           USING     D@TEST,11
           OFADBGMEM DATA,0
           AR        3,4
           OFADBGREG 3
           BR        14
DATA       DC        CL4'0123'      
           END
