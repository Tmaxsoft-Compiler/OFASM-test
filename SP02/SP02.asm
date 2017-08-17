SP02      CSECT
          LR        12,15
          USING     SP02,12

          SP        SDATA1,SDATA2
          L         2,SDATA1
          OFADBGREG 2

          SP        SDATA3,SDATA4
          L         2,SDATA3
          OFADBGREG 2

          BR        14

SDATA1    DC        PL4'-3'
SDATA2    DC        PL4'2'
SDATA3    DC        PL4'5'
SDATA4    DC        PL4'1'

          END
