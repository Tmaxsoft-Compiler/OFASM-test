SAM31  CSECT 
       USING *,15
       SAM31
       LA 2,ADDR
       C  2,=X'01000000'
       BNL  NGT
OKT    OFADBGMEM OK,1
       B TST2
NGT    OFADBGMEM NG,1
       B TST2

TST2   SAM24
       LA 2,ADDR
       C  2,=X'01000000'
       BNL  OKT
NGT    OFADBGMEM NG,1
       B EXIT       
OKT    OFADBGMEM OK,1
       B EXIT

EXIT   EQU *
       BR 14
ADDR   DS A
OK     DC C'OK'
NG     DC C'NG'
       END 
