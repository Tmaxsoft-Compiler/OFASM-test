LCR01      CSECT
           LR        12,15
           USING     LCR01,12
*
           L      2,=XL4'FFFFFFFE'
           LCR    3,2
           OFADBGREG 3

           L      2,=XL4'00000001'
           LCR    3,2
           OFADBGREG 3

           L      2,=XL4'00000000'
           LCR    3,2
           OFADBGREG 3

           L      2,=XL4'80000000'
           LCR    3,2
           OFADBGREG 3
           
*
           BR        14
           END
