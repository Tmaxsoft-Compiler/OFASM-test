COPXOR      CSECT
            LR        12,15
            USING     COPXOR,12
            USING     PSA,0
            L         7,FLCCVT
            USING     CVT,7
* CVTSNAME 
            OFADBGMEM 340(8,7),1
            OFADBGMEM CVTSNAME,1
            LG        5,340(7) 
            OFADBGREG 5
            L         6,PSATOLD
            USING     TCB,6
            L         6,TCBEXT2
*            DROP      6
            USING     TCBXTNT2,6
            L         0,TCBCAUF
*            DROP      6
            L         6,PSAAOLD
            USING     ASCB,6
            L         6,ASCBASXB
*            DROP      6
            USING     ASXB,6
            OFADBGMEM ASXBUSER,0

            BR        14
            EJECT
            IHAPSA    DSECT=YES,LIST=YES
            EJECT
            CVT       DSECT=YES,LIST=YES
            EJECT
            IKJTCB    DSECT=YES,LIST=YES
            EJECT
            IHAASCB   DSECT=YES,LIST=YES
            EJECT
            IHAASXB   DSECT=YES,LIST=YES
            END
            
