TEST    CSECT
        LR          12,15
        USING       TEST,12 
        DP          DATA1,DATA2
        OFADBGMEM   DATA1,0
        BR          14
*
DATA1   DC          PL5'012345678'
DATA2   DC          PL2'-321'
        END
