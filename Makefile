dir_list = A01 \
           AR01 \
           AL01 \
           ALR01 \
           AH01 \
           BAKR01 \
           BAS01 \
           BASR01 \
           BC01 \
           BCT01 \
           BE01 \
           BH01 \
           BHE01 \
           BHR01 \
           BL01 \
           BLE01 \
           BLH01 \
           BLR01 \
           BM01 \
           BMR01 \
           BNE01 \
           BNER01 \
           BNH01 \
           BNHE01 \
           BNL01 \
           BNLE01 \
           BNM01 \
           BNP01 \
           BNZ01 \
           BP01 \
           BRAS01 \
           BRC01 \
           BRCT01 \
           BRXH01 \
           BRXLE01 \
           BXH01 \
           BXLE01 \
           BZ01 \
           CALL01 \
           CALL02 \
           CDS01 \
           CG01 \
           CGHI01 \
           CGR01 \
           CHI01 \
           CKSM01 \
		   CLCL02 \
		   CLCL03 \
           CLFI01 \
           CLG01 \
           CLGFR01 \
           CLGR01 \
           CLHHSI01 \
           CLIY01 \
           CLMY01 \
           CLST01 \
           CLY01 \
           CS01 \
           CSECT01 \
           CSECT02 \
           CSECT03 \
           CSG01 \
           CVBG01 \
           CVBY01 \
           CVD01 \
           D01 \
           D02 \
           DC01 \
           DP01 \
           DP02 \
           DR01 \
           ENTRY02 \
           J01 \
           J02 \
           JAS01 \
           JCT01 \
           JNOP01 \
           L01 \
           L02 \
           LARL01 \
           LAY01 \
           LG01 \
           LGB01 \
           LGF01 \
           LGH01 \
           LGHI01 \
           LGR01 \
           LHI01 \
           LHY01 \
           LLC01 \
           LLGC01 \
           LLGF01 \
           LLGFR01 \
           LLGH01 \
           LLGT01 \
           LLH01 \
           LLILF01 \
           LLILH01 \
           LLILL01 \
           LMD01 \
           LMG01 \
           LMH01 \
           LNR01 \
           LOCTR01 \
           LPR01 \
           LRVG01 \
           LT01 \
           LTGR01 \
           LY01  \
           N01 \
           NC01 \
           NR01 \
           M01 \
           MH01 \
           MP01 \
		   MVCL02 \
	       MVCL03 \
           O01 \
           OC01 \
           OFADBGREG01 \
           OFADBGMEM01 \
           OFADBGMEM02 \
           OI01 \
           PACK01  \
           PACK02  \
           PC01  \
           PKA01  \
           PR01  \
           UNPKA01  \
		   S01 \
           SLA01 \
           SLL01 \
           SLDA01 \
           SLDL01 \
		   SR01 \
           SPM01 \
           SRA01 \
           SRL01 \
           SRDA01 \
           SRDL01 \
           SRLG01 \
           SRP01 \
           SRP02 \
           SRST01 \
		   STCMH01 \
		   STCK01 \
		   STCKE01 \
		   STD01 \
		   STG01 \
		   STHY01 \
		   STMG01 \
		   STMH01 \
		   STY01 \
           TMLH01 \
           TMLL01 \
           TMY01 \
           TP01 \
           TS01 \
           TPROT01 \
		   MVIY01 \
		   MVST01 \
		   MVO01 \
           ICM01 \
	       ICMY01 \
		   II01 \
           IPK01 \
           IPM01 \
           UNPK01 \
           XC01 \
           XI01 \
           XI02 \
           XR01 \
           ZAP01 

all:
	@set CDPATH=""; export CDPATH; \
	for dir in $(dir_list); do \
	if [ -f $$dir/Makefile ]; then \
		echo; \
		echo '-------------------------------'; \
		echo '   Compiling ' $$dir; \
		echo '-------------------------------'; \
		echo; \
		cd $$dir; \
		$(MAKE) all || exit 1; \
		cd $(CURDIR); \
	fi; \
	done;

test:
	@set CDPATH=""; export CDPATH; \
	for dir in $(dir_list); do \
	if [ -f $$dir/Makefile ]; then \
		echo; \
		echo '-------------------------------'; \
		echo '   test ' $$dir; \
		echo '-------------------------------'; \
		echo; \
		cd $$dir; \
		$(MAKE) test || exit 1; \
		cd $(CURDIR); \
	fi; \
	done;


clean:
	@set CDPATH=""; export CDPATH; \
	for dir in $(dir_list); do \
	if [ -f $$dir/Makefile ]; then \
		echo; \
		echo '-------------------------------'; \
		echo '   clean ' $$dir; \
		echo '-------------------------------'; \
		echo; \
		cd $$dir; \
		$(MAKE) clean || exit 1; \
		cd $(CURDIR); \
	fi; \
	done;

