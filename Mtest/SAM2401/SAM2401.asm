SAM2401    CSECT
           LR        12,15
           USING     SAM2401,12
*
           L         2,0(1)
           LG        3,=X'FFFFFFFFFFFFFFFF' 
           SAM24
           LAY       3,0(2)
           OFADBGREG 3
           ST        3,0(2)
*
           L         2,4(1)
           LG        3,=X'FFFFFFFFFFFFFFFF' 
           SAM31     
           LAY       3,0(2)
           OFADBGREG 3
           ST        3,0(2)
*
           BR        14
           END
