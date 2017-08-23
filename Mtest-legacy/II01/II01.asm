II01       CSECT
           LR        12,15
           USING     II01,12
TEST#00    EQU       *
           LG        5,SRC#01
           IIHF      5,X'12345678'
* TODO: test after implementing CG
*           CG        5,EXPT#01
*           BNE       ERROR
           OFADBGREG 5
TEST#01    EQU       *
           LG        5,SRC#01
           IIHH      5,X'1234'
* TODO: test after implementing CG
*           CG        5,EXPT#02
*           BNE       ERROR
           OFADBGREG 5
TEST#02    EQU       *
           LG        5,SRC#01
           IIHL      5,X'1234'
* TODO: test after implementing CG
*           CG        5,EXPT#02
*           BNE       ERROR
           OFADBGREG 5
TEST#03    EQU       *
           LG        5,SRC#01
           IILF      5,X'12345678'
* TODO: test after implementing CG
*           CG        5,EXPT#03
*           BNE       ERROR
           OFADBGREG 5
TEST#04    EQU       *
           LG        5,SRC#01
           IILH      5,X'1234'
* TODO: test after implementing CG
*           CG        5,EXPT#04
*           BNE       ERROR
           OFADBGREG 5
TEST#05    EQU       *
           LG        5,SRC#01
           IILH      5,X'1234'
* TODO: test after implementing CG
*           CG        5,EXPT#05
*           BNE       ERROR
           OFADBGREG 5
TEST#06    EQU       *
           LG        5,SRC#01
           IILL      5,X'1234'
* TODO: test after implementing CG
*           CG        5,EXPT#06
*           BNE       ERROR
           OFADBGREG 5
           BE        SUCCESS
ERROR      EQU       *
           L         15,=F'1'
           B         END
SUCCESS    EQU       *
           XR        15,15
           B         END
END        EQU       *
           BR        14
SRC#01     DC        XL8'FFFFFFFFFFFFFFFF' 
EXPT#01    DC        XL8'12345678FFFFFFFF' 
EXPT#02    DC        XL8'1234ffffffffffff' 
EXPT#03    DC        XL8'ffff1234ffffffff' 
EXPT#04    DC        XL8'ffffffff12345678' 
EXPT#05    DC        XL8'ffffffff1234ffff' 
EXPT#06    DC        XL8'ffffffffffff1234' 
           END
