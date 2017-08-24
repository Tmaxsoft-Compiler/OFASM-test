****************************************************************
* FILENAME: DR01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
DR01       CSECT
           LR        12,15
           USING     DR01,12
           LG        7,DATA
           LG        8,DATA2
           DR        6,8
           OFADBGREG 6
           OFADBGREG 7
* divisor is in bit poisitons 32-63 of R2
* remainde -> 32-63 in R1
           BR        14
DATA       DC        XL8'8DE'
DATA2      DC        XL8'32'
           END
