I146155A    DFHEIENT CODEREG=12
            EXEC CICS ADDRESS TCTUA(PTCTUA)

            L      2,PTCTUA
            CLC    0(4,2),=F'0'
            BNE    RETURN
            MVC    0(4,2),=F'1'
 
RETURN      EXEC CICS RETURN
            BR     14
PTCTUA      DS     A
WSTCTUA     DS     F
            END
