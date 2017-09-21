****************************************************************
* FILENAME: CLCL01.asm
* AUTHOR: SEOKJUN HONG
* SYSTEM: OFASM v4.0 revision 113
****************************************************************
CLCL01     CSECT
           LR        12,15
           USING     CLCL01,12
           LA        4,DATA
           LA        5,30
           LA        8,DATA2
           LA        9,30
           CLCL      4,8
           OFADBGREG 4
***************************************************
           LA        4,DATA
           LA        5,30
           LA        8,DATA3
           LA        9,30
           CLCL      4,8
           OFADBGREG 4
***************************************************
           LA        4,DATA3
           LA        5,30
           LA        8,DATA
           LA        9,30
           CLCL      4,8
           OFADBGREG 4
*****************************************************
           LA        4,DATA
           LA        5,30
           ICM       5,B'1000',=X'A'
           L         6,=X'A'
           OFADBGREG 5
           OFADBGREG 6
           OFADBGMEM 0(30,4),0
           OFADBGMEM 0(8,5),0
           LA        8,DATA2
           LA        9,36
           CLCL      4,8
           OFADBGREG 4
           BR        14
DATA       DC        CL30'ABJEIJFHIBJOBCIHQOIJGOIH123113'
DATA2      DC        CL36'ABJEIJFHIBJOBCIHQOIJGOIH123113AAAAAA'
DATA3      DC        CL30'ABJEIJFHIBJOBCIHQOIJGOIHQ23113'
PADDING    DC        X'A'
           END
