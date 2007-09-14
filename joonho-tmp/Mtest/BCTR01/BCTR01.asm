BCTR01  CSECT
        STM 14,12,12(13)
        LR  3,15
        USING BCTR01,3

        L  4,0(0,1)
        L  5,4(0,1)
        L  5,0(0,5)
        LA 6,LOOP
        OFADBGREG 5
LOOP    EQU *
        CLI 0(4),X'40'
        BE PRINT
        LA   4,1(0,4)
        BCTR 5,6
PRINT   EQU *
        OFADBGMEM 0(0,4),=F'1'
        OFADBGREG 5
        B RETURN
RETURN  EQU *
        LM  14,12,12(13)
        BC  15,0(0,14)
        END
