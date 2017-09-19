STCMH01    CSECT
           LR        12,15
           USING     STCMH01,12
           LG        3,FIELD2
* STORE FULL WORD
           STCMH     3,B'1111',FIELD1
*           OFADBGMEM FIELD1(0),=F'8'
           CLC       FIELD2(8),FIELD1
           BNE       ERROR
* STORE HALF
           MVI       FIELD1,X'00'
           MVC       FIELD1+1(7),FIELD1
           STCMH     3,B'1100',FIELD1
*           OFADBGMEM FIELD1(0),=F'8'
           CLC       RESULT1(8),FIELD1
           BNE       ERROR
* STORE CHARACTER
           MVI       FIELD1,X'00'
           MVC       FIELD1+1(7),FIELD1
           STCMH     3,B'1000',FIELD1
*           OFADBGMEM FIELD1(0),=F'8'
           CLC       RESULT2(8),FIELD1
           BNE       ERROR
* STORE B'1001'
           MVI       FIELD1,X'00'
           MVC       FIELD1+1(7),FIELD1
           STCMH     3,B'1001',FIELD1
*           OFADBGMEM FIELD1(0),=F'8'
           CLC       RESULT3(8),FIELD1
           BNE       ERROR
* STORE B'0110'
           MVI       FIELD1,X'00'
           MVC       FIELD1+1(7),FIELD1
           STCMH     3,B'0110',FIELD1
*           OFADBGMEM FIELD1(0),=F'8'
           CLC       RESULT4(8),FIELD1
           BNE       ERROR
* STORE B'1010'
           MVI       FIELD1,X'00'
           MVC       FIELD1+1(7),FIELD1
           STCMH     3,B'1010',FIELD1
*           OFADBGMEM FIELD1(0),=F'8'
           CLC       RESULT5(8),FIELD1
           BNE       ERROR
           B         SUCCESS
ERROR      EQU       *
           L         15,=F'01'
           B         END
SUCCESS    EQU       *
           XR        15,15
           B         END
END        EQU       *
           BR        14
FIELD1     DS        CL8
FIELD2     DC        XL8'0102030400000000'
RESULT1    DC        XL8'0102000000000000'
RESULT2    DC        XL8'0100000000000000'
RESULT3    DC        XL8'0104000000000000'
RESULT4    DC        XL8'0203000000000000'
RESULT5    DC        XL8'0103000000000000'
           END
