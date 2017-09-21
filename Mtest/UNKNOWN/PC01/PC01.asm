PC01       CSECT
           LR        12,15
           USING     PC01,12
*
           L         2,0(1)
           L         3,0(2)
           LA        5,RETURN1    
           BAKR      5,0
           LA        5,RETURN2    
           BAKR      5,0
           PC        1
           OFADBGREG 5
           PR
           AH        3,=H'10'
           OFADBGREG 5
RETURN1    ST        3,0(2)
*
           L         2,4(1)
           L         3,0(2)
           AH        3,=H'2'
RETURN2    ST        3,0(2)
*
           BR        14
           END
