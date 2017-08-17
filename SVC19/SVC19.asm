SVC19      CSECT
           USING SVC19,12
           LR    12,15
           OPEN  (INFILE,(INPUT))
AT#END     BR    14
****INFILE     DCB   DDNAME=SYSUT1,DSORG=PS,MACRF=GM,EODAD=AT#END
*                                        DATA CONTROL BLOCK
INFILE     DC    0F'0'                   ORIGIN ON WORD BOUNDARY         
*                                        DIRECT ACCESS DEVICE INTERFACE
           DC    BL16'0'                 FDAD,DVTBL                     
           DC    A(0)                    KEYLE,DEVT,TRBAL               
*                       COMMON ACCESS METHOD INTERFACE
           DC    AL1(0)                  BUFNO                           
           DC    AL3(1)                  BUFCB                           
           DC    AL2(0)                  BUFL                            
           DC    BL2'0100000000000000'   DSORG                 
           DC    A(1)                    IOBAD                           
*                       FOUNDATION EXTENSION
           DC    BL1'00000000'           BFTEK,BFLN,HIARCHY       
           DC    AL3(AT#END)             EODAD                           
           DC    BL1'00000000'           RECFM
           DC    AL3(0)                  EXLST                           
*                       FOUNDATION BLOCK
           DC    CL8'SYSUT1'             DDNAME                          
           DC    BL1'00000010'           OFLGS                           
           DC    BL1'00000000'           IFLG                            
           DC    BL2'0101000000000000'   MACR
*                       BSAM-BPAM-QSAM INTERFACE
           DC    BL1'00000000'                                           
           DC    AL3(1)                  CHECK, GERR, PERR               
           DC    A(1)                    SYNAD                           
           DC    H'0'                    CIND1, CIND2                    
           DC    AL2(0)                  BLKSIZE                         
           DC    F'0'                    WCPO, WCPL, OFFSR, OFFSW        
           DC    A(1)                    IOBA                            
           DC    AL1(0)                  NCP                             
           DC    AL3(1)                  EOBR, EOBAD                     
*                            QSAM INTERFACE
           DC    A(1)                     RECAD                          
           DC    H'0'                    QSWS                            
           DC    AL2(0)         LRECL                                    
           DC    BL1'00000000'           EROPT                           
           DC    AL3(1)                  CNTRL                           
           DC    F'0'                    PRECL                           
           DC    A(1)                    EOB                             
           END
