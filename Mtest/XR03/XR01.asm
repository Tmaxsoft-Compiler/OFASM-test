****************************************************************
* FILENAME: XR01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
XR01       CSECT
           LR        12,15
           USING     XR01,12
           L         5,=XL4'10110010'
           L         6,=XL4'11010100'
           XR        5,6
           OFADBGREG 5
           L         5,=XL4'11010100'
           XR        5,6
           OFADBGREG 5
           BR        14
           END
