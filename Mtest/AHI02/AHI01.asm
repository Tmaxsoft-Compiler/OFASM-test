****************************************************************
* FILENAME: AHI01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
AHI01      CSECT
           LR        12,15
           USING     AHI01,12
           L         5,=H'0000'
           AHI       5,10
           OFADBGREG 5
           BR        14
           END
