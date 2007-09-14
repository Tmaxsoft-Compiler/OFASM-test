ALY02      CSECT
           LR        12,15
           USING     ALY02,12

           L         2,=F'0'
           ALY       2,=F'0'
           OFADBGREG 2

           L         2,=F'1'
           ALY       2,=F'0'
           OFADBGREG 2

           L         2,=X'FFFFFFFF'
           ALY       2,=X'00000001'
           OFADBGREG 2

           L         2,=X'FFFFFFFF'
           ALY       2,=X'00000002'
           OFADBGREG 2

           BR        14

           END
