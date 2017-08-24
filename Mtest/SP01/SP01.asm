SP01       CSECT
R0         EQU       0 
R1         EQU       1
R2         EQU       2
R3         EQU       3
R4         EQU       4
R5         EQU       5
R6         EQU       6
R7         EQU       7
R8         EQU       8
R9         EQU       9
R10        EQU       10
R11        EQU       11
R12        EQU       12
R13        EQU       13
R14        EQU       14
R15        EQU       15
*********************************************************************
           LR        12,15
           USING     SP01,12
           MVC       WTO#DATA(2),ZONE
           LA        1,WTO#L
           SVC       35
           PACK      PACK,ZONE
           SP        PACK,=PL2'1'
           UNPK      ZONE,PACK
           MVC       WTO#DATA(2),ZONE
           LA        1,WTO#L
           SVC       35
           BR        14
ZONE       DC        XL2'30303032'
PACK       DS        PL2
WTO#L      DC        AL2(6)
           DC        B'0000000000000000'
WTO#DATA   DC        CL2'    '
           END

