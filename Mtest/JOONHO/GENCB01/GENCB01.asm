GENCB01     CSECT 
           USING GENCB01,12 
           LR    12,15 
           ST    14,SAVE 
           OPEN  (OTDCB,(OUTPUT)) 
           LHI   0,VSAM#LEN 
           GETMAIN R,LV=(0) 
           LR    7,1 
           L     4,=F'4'
           USING VSAMAREA,7 
GEN@ACB    GENCB MF=(G,(S,ACB#AREA),ACBLEN),                           X
               BLK=ACB,DDNAME=METSTL,MACRF=(KEY,DIR,IN),KEYLEN=(4) 
           LTR   15,15 
           BNZ   BADOPEN 
           LR    2,1 
           OPEN  ((2),(INPUT))
           MVC   IOAREA1,0(2)
*          PUT   OTDCB,IOAREA1
           GENCB MF=(G,(S,RPL#AREA),RPLLEN),AREA=VIOAREA,AREALEN=80,   X
               BLK=RPL,ACB=(2),OPTCD=(KEY,LOC,DIR),KEYLEN=(4),         X
               ARG=KEYAREA
           LTR   15,15 
           BNZ   BADOPEN 
           ST    1,RPLADDR
           MVC   IOAREA1,0(1)
*          PUT   OTDCB,IOAREA1
           ZAP   INCNT,=P'0'
           L     1,RPLADDR
FILEIO     GET   RPL=(1)
           LTR   15,15
           BNZ   BADOPEN
           PUT   OTDCB,VIOAREA
           CLOSE OTDCB 
           CLOSE ((2))
           L     14,SAVE 
           BR    14 
BADOPEN    ABEND (10,DUMP) 

KEYAREA    DC    CL4'BBBB'
INCNT      DS    PL2
WORK       DS    CL120 
SAVE       DS    F 
OTDCB      DCB   DDNAME=OTDCB,LRECL=80,DSORG=PS,MACRF=PM 
IOAREA1    DS    XL(80)
IOAREA2    DS    XL(80)
VIOAREA    DS    CL80
RPLADDR    DS    F 
MSG        DC    CL3'BAD'
VSAMAREA   DSECT 
ACB#AREA   DS    XL(ACBLEN) 
RPL#AREA   DS    XL(RPLLEN) 
VSAM#LEN   EQU   *-VSAMAREA
           END 
