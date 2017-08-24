TEST       CSECT             
           LR        12,15
           USING     TEST,12
           OFADBGMEM DATA1,0
           OFADBGMEM DATA2,0
           OFADBGMEM DATA3,0
           OFADBGMEM DATA4,0
           BR        14
DATA1      DC        CL8'ABCDEFGH'
DATA2      DC        XL4'00010203'
DATA3      DC        F'-1'
DATA4      DC        H'-1'
           END
