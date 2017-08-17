CLHHSI01        CSECT
           LR        12,15
           USING     CLHHSI01,12
           LA        15,0
           B         TEST1
**********************************************
TEST1      CLHHSI    DATA1,C'13'
           BL        TEST2
           LA        15,1
           B         END
**********************************************
TEST2      CLHHSI    DATA2,C'23'
           BZ        TEST3
           LA        15,2
           B         END
**********************************************
TEST3      CLHHSI    DATA3,C'33'
           BH        END
           LA        15,3
           B         END
**********************************************
END        BR        14
**********************************************
DATA1      DC        C'12'
DATA2      DC        C'23'
DATA3      DC        C'34'
           END
