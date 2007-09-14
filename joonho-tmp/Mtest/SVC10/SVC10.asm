SVC10      CSECT
           LR        12,15
           USING     SVC10,12
           GETMAIN   R,LV=48000
           FREEMAIN  R,LV=48000,A=(1)
           BR        14   
           END
