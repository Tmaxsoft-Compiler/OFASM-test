BXH02           CSECT
                LR          12,15
                USING       BXH02,12
* using even register number
                L           4,=F'10'
                L           6,=F'-1'
                L           7,=F'1'
EVEN_START      BXH         4,6,EVEN_START
                OFADBGREG   4
* using odd register number
                L           4,=F'10'
                L           5,=F'-1'
                L           6,=F'1'
ODD_START       BXH         4,5,ODD_START
                OFADBGREG   4

                L           8,=X'00004131'
                L           9,=F'4'
                L           10,=F'24'
                LA          11,TABLE
SEARCH          LNR         9,9
NOTEQUAL        BXH         10,9,LOOP
NOTFOUND        SR          8,8
                OFADBGMEM   =C'NOT FOUND',1
                BR          14
LOOP            CH          8,0(10,11)
                BC          7,NOTEQUAL
                LH          8,2(10,11)
                OFADBGMEM   =C'FOUND',1
                OFADBGREG   8
                BR          14
                END
TABLE           DC          CL24'A1F1A2F2A3F3A4F4A5F5A6F6'
