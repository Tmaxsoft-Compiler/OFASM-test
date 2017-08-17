BSM02      CSECT
           LR        12,15
           LR        9,14
           USING     BSM02,12
*
           OPEN      (OUTFILE,OUTPUT)
           PUT       OUTFILE,OTAREA
           L         7,OTAREA
           LR        5,7
           LA        6,ST2
           BSM       5,6
ST2        ST        5,OTAREA
           PUT       OUTFILE,OTAREA
           LA        6,ST3
           LR        5,7
           BSM       5,6
ST3        ST        5,OTAREA
           PUT       OUTFILE,OTAREA
           CLOSE     OUTFILE
           BR        9
OTAREA     DC        80X'FF'
OUTFILE    DCB       DDNAME=SYSUT2,DSORG=PS,MACRF=PM
           END 
