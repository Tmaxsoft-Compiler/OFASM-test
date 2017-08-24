PR01       CSECT
           LR        12,15
           USING     PR01,12
*
           L         2,0(1)
           L         3,0(2)
           LA        5,RETURN1    
           BAKR      5,0
           OFADBGREG 5
           PR
           AH        3,=H'10'
           OFADBGREG 5
RETURN1    ST        3,0(2)
*
           L         2,4(1)
           L         3,0(2)
           AH        3,=H'2'
JUMP2      ST        3,0(2)
*
           BR        14
           END
