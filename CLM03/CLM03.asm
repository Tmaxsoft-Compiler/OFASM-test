CLM03      CSECT
           LR        12,15
           USING     CLM03,12
           L         2,=A(X'00010203')

           CLM       2,B'0000',=X'0123'
           OFADBGREG 2

           CLM       2,B'0001',=X'0123'
           OFADBGREG 2

           CLM       2,B'0100',=X'0123'
           OFADBGREG 2

           CLM       2,B'0110',=X'0123'
           OFADBGREG 2

           CLM       2,B'1000',=X'0123'
           OFADBGREG 2

           CLM       2,B'1111',=X'0123'
           OFADBGREG 2

           BR        14
           END
