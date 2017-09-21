LMD01      CSECT
           LR        12,15
           USING     LMD01,12
*           LA        13,DATA
           LMD       15,11,DATA,DATA2
           OFADBGREG 15
           OFADBGREG 0
           OFADBGREG 2
           OFADBGREG 3
           OFADBGREG 4
           OFADBGREG 5
           OFADBGREG 6
           OFADBGREG 7
           OFADBGREG 8
           OFADBGREG 9
           OFADBGREG 10
           OFADBGREG 11
           BR        14
DATA       DC        XL4'AAAAAAAA'
           DC        XL4'BBBBBBBB'
           DC        XL4'CCCCCCCC'
           DC        XL4'DDDDDDDD'
           DC        XL4'EEEEEEEE'
           DC        XL4'FFFFFFFF'
           DC        XL4'00000000'
           DC        XL4'11111111'
           DC        XL4'22222222'
           DC        XL4'33333333'
           DC        XL4'44444444'
           DC        XL4'55555555'
           DC        XL4'66666666'
           DC        CL4'77777777'
           DC        CL4'88888888'
           DC        CL4'99999999'
*
DATA2      DC        XL4'00000000'
           DC        XL4'11111111'
           DC        XL4'22222222'
           DC        XL4'33333333'
           DC        XL4'44444444'
           DC        XL4'55555555'
           DC        XL4'66666666'
           DC        CL4'77777777'
           DC        CL4'88888888'
           DC        CL4'99999999'
           DC        XL4'AAAAAAAA'
           DC        XL4'BBBBBBBB'
           DC        XL4'CCCCCCCC'
           DC        XL4'DDDDDDDD'
           DC        XL4'EEEEEEEE'
           DC        XL4'FFFFFFFF'
           END
