UNPKA02      CSECT
             LR        12,15
             USING     UNPKA02,12

             UNPKA     UDATA,PDATA1
             LG        2,UDATA
             OFADBGREG 2

             UNPKA     UDATA,PDATA2
             LG        2,UDATA
             OFADBGREG 2

             BR        14

UDATA        DS        CL8
PDATA1       DC        XL4'1234567C'
PDATA2       DC        XL4'1234567D'

             END
