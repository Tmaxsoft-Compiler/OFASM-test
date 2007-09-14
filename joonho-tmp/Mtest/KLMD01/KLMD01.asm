KLMD01     CSECT
* FIXME: check if result is right
           LR        12,15
           USING     KLMD01,12
           SR        0,0
           SR        1,1
* TEST SHA1
           L         0,=F'1'
           L         5,=F'10'
           LA        1,ICV#01
           LA        4,MD#01
           KLMD      5,4
           OFADBGMEM ICV#01(0),=F'20'
* TEST SHA1
           L         0,=F'1'
           L         5,=F'10'
           LA        1,ICV#01
           LA        4,MD#02
           KLMD      5,4
           OFADBGMEM ICV#01(0),=F'20'
* TEST SHA1
           L         0,=F'1'
           L         5,=F'62'
           LA        1,ICV#01
           LA        4,MD#02
           KLMD      5,4
           OFADBGMEM ICV#01(0),=F'20'
* TEST SHA256
           L         0,=F'2'
           L         5,=F'10'
           LA        1,ICV#02
           LA        4,MD#01
           KLMD      5,4
           OFADBGMEM ICV#02(0),=F'32'
* TEST SHA512
           L         0,=F'3'
           L         5,=F'62'
           LA        1,ICV#02
           LA        4,MD#02
           KLMD      5,4
           OFADBGMEM ICV#02(0),=F'32'
           BE        SUCCESS
ERROR      EQU       *
           L         15,=F'1'
           B         END
SUCCESS    EQU       *
           XR        15,15
           B         END
END        EQU       *
           BR        14
ICV#01     DS        XL20
ICV#02     DS        XL32
MD#01      DC        CL10'ABCDEFGHIJ'
MD#02      DC        CL10'0123456789'
           DC        CL26'ABCDEFGHIJKLMNOPQRSTUVWZYX'
           DC        CL26'abcdefghijklmnopqrstuvwxyz'
           END
