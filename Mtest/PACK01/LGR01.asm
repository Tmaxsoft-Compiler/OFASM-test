LGR01      CSECT
           LR        12,15
           USING     LGR01,12
*
           PACK      DATA1,DATA2+10(6)
           OFADBGMEM DATA1(0),=F'4'
           OFADBGMEM DATA2(0),=F'4'
           BR        14
DATA1      DS        XL4
DATA2      DC        X'32303135303931303230313530393131323031353130'
           END
