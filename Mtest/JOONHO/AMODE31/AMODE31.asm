AMODE31 CSECT
AMODE31 AMODE 31
AMODE31 RMODE 31
       USING *,15

       LA    2,SYN
       C     2,=X'01000000'
       BNL   OKT

OKT    OFADBGMEM OK,1
       B EXIT
NGT    OFADBGMEM NG,1
       B EXIT

EXIT   EQU *               
       BR    14
SYN    DS    F
OK     DC    C'OK'
NG     DC    C'NG'
       END 
