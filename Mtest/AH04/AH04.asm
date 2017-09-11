*************************************************
* FILENAME : AH04.asm
* AUTHOR : HYUK KIM
* SYSTEM : OFASM v4 revision 113
*************************************************
        MACRO
        MAC_AH      &VALUE1,&VALUE2,&RESULT
        L           2,&VALUE1
        AH          2,&VALUE2
        ST          2,&RESULT
        OFADBGREG   2
        MEND
* AH R1,XBDDD
*    R1        == signed 32bits ==> -2147483648 ~ 2147483647
*    XBDDD     == signed 16bits ==> -32768 ~ 32767
*    result R1 == signed 32bits ==> -2147483648 ~ 2147483647
AH04    CSECT
        LR          12,15
        USING       AH04,12

* 0 + 0 => 0
        MAC_AH      =F'0',=H'0',ZZ
* 0 + + => +
        MAC_AH      =F'0',=H'32767',ZP
* 0 + - => -
        MAC_AH      =F'0',=H'-32768',ZM
* + + 0 => +
        MAC_AH      =F'2147483647',=H'0',PZ
* + + + => +
**      => in
        MAC_AH      =F'2147483640',=H'7',PP0
        MAC_AH      =F'7',=H'32760',PP1
**      => out
        MAC_AH      =F'2147483647',=H'10',PP2
        MAC_AH      =F'10',=H'32767',PP3
* + + - => 0/+/-
**      => 0(|+| == |-|)
        MAC_AH      =F'32768',=H'-32768',PM0
**      => +(|+| > |-|)
        MAC_AH      =F'32769',=H'-32768',PM1
**      => -(|+| < |-|)
        MAC_AH      =F'32767',=H'-32768',PM2
* - + 0 => -
        MAC_AH      =F'-32769',=H'0',MZ
* - + + => 0/+/-
**      => 0(|-| == |+|)
        MAC_AH      =F'-32767',=H'32767',MP0
**      => +(|-| < |+|)
        MAC_AH      =F'-32766',=H'32767',MP1
**      => -(|-| > |+|)
        MAC_AH      =F'-32768',=H'32767',MP2
* - + - => -
*       => in
        MAC_AH      =F'-2147483640',=H'-8',MM0
        MAC_AH      =F'-8',=H'-32760',MM1
*       => out
        MAC_AH      =F'-2147483648',=H'-10',MM2
        MAC_AH      =F'-1',=H'-32768',MM3

        OFADBGMEM   RESULTS,0
        BR          14
        END
* Defining Data
RESULTS DS          0FL76
ZZ      DS          F
ZP      DS          F
ZM      DS          F
PZ      DS          F
PP0     DS          F
PP1     DS          F
PP2     DS          F
PP3     DS          F
PM0     DS          F
PM1     DS          F
PM2     DS          F
MZ      DS          F
MP0     DS          F
MP1     DS          F
MP2     DS          F
MM0     DS          F
MM1     DS          F
MM2     DS          F
MM3     DS          F
