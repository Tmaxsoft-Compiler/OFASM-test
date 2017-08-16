TEST       CSECT             
           LR        12,15
           USING     TEST,12
           OFADBGMEM DATA1,1
           BR        14
DATA1      DC        CL8'ABCDEFGH'
           END
