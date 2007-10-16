BELOW   CSECT
        AMODE 31
        RMODE 31
        USING BELOW,12
        LR    12,15
        LR    11,14
        ST    12,SAVE
        LOAD  EP=ABOVE
        LR    15,0
        BASSM 14,15
        L     12,SAVE
        OFADBGMEM OK,1
        BR    11
OK      DC    CL2'OK'
SAVE    DS    F
        LTORG
        END

