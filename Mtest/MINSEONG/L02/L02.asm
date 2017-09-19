****************************************************************
*        FILENAME: L02.asm                                     *
*        AUTHOR  : MINSEONG LEE                                *
*        SYSTEM  : OFASM v3.0                                  *
****************************************************************
L02         CSECT
            LR          12,15
            USING       L02,12
* FULLWORD
            L           2,FULL0
            OFADBGREG   2
            L           2,FULL1
            OFADBGREG   2
            L           2,FULLMAX
            OFADBGREG   2
* BINARY
            L           3,BIN0
            OFADBGREG   3
            L           3,BIN1
            OFADBGREG   3
            L           3,BINMAX
            OFADBGREG   3
* HEXA-DECIMAL
            L           4,HEX0
            OFADBGREG   4
            L           4,HEX1
            OFADBGREG   4
            L           4,HEXMAX
            OFADBGREG   4
* HALF-WORD
            L           5,HALF0
            OFADBGREG   5
            L           5,HALF1
            OFADBGREG   5
            L           5,HALFMAX
            OFADBGREG   5
            BR          14
*---------------------------------------------------
* FULLWORD DATA         1 length    Fullword-align
*---------------------------------------------------
FULL0       DC          F'0'
FULL1       DC          F'1'
FULLMAX     DC          F'4294967295'
*--------------------------------------------------
* BINARY DATA           1 length    byte-align
*--------------------------------------------------
BIN0        DC          B'0'
BIN1        DC          B'1'
BINMAX      DC          B'11111111111111111111111111111111'
*--------------------------------------------------
* HEXADECIMAL DATA      1 length    byte-align
*--------------------------------------------------
HEX0        DC          X'0'
HEX1        DC          X'1'
HEXMAX      DC          X'FFFFFFFF'
*--------------------------------------------------
* HALFWORD DATA         2 length    halfword-align
*--------------------------------------------------
HALF0       DC          H'0'
HALF1       DC          H'1'
HALFMAX     DC          H'65535'
            END
