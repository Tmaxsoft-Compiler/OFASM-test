****************************************************************
* FILENAME: LH01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
LH01       CSECT
           LR        12,15
           USING     LH01,12
           LH        5,=H'1234'
           OFADBGREG 5
           LH        5,=H'-234'
           OFADBGREG 5
           BR        14
           END
