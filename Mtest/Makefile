dir_list = A01 \
           AH01 \
           AH02 \
           AH03 \
           AH04 \
           AHI02 \
           AL01 \
           ALR01 \
           AP02 \
           AR01 \
           B01 \
           BAKR01 \
           BAKR02 \
           BAL01 \
           BALR01 \
           BAS01 \
           BAS02 \
           BASR01 \
           BASR02 \
           BASSM01 \
           BC01 \
           BC02 \
           BCR02 \
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
           BSM03 \
           BXH01 \
           BXH02 \
           BXLE01 \
           BZ01 \
           CALL01 \
           CALL02 \
           CDS01 \
           CG01 \
           CGHI01 \
           CGR01 \
           CH02 \
           CHI01 \
           CKSM01 \
           CL02 \
           CLC02 \
           CLCL02 \
           CLCL03 \
           CLFI01 \
           CLG01 \
           CLGFR01 \
           CLGR01 \
           CLHHSI01 \
           CLI02 \
           CLIY01 \
           CLM01 \
           CLMY01 \
           CLR02 \
           CLST01 \
           CLY01 \
           CP02 \
           CR02 \
           CS01 \
           CSECT01 \
           CSECT02 \
           CSECT03 \
           CSG01 \
           CVB02 \
           CVBG01 \
           CVBY01 \
           CVD01 \
           CVD02 \
           D01 \
           D02 \
           D02 \
           DC01 \
           DP01 \
           DP02 \
           DP03 \
           DR01 \
           DR02 \
           ED01 \
           EDMK01 \
           ENTRY02 \
           ICM01 \
           ICMY01 \
           II01 \
           IPK01 \
           IPM01 \
           J01 \
           J02 \
           JAS01 \
           JCT01 \
           JNOP01 \
           L01 \
           L02 \
           L03 \
           LA01 \
           LARL01 \
           LAY01 \
           LG01 \
           LGB01 \
           LGF01 \
           LGH01 \
           LGHI01 \
           LGR01 \
           LH01 \
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
           LR02 \
           LRVG01 \
           LT01 \
           LTGR01 \
           LY01  \
           M01 \
           M02 \
           MH01 \
           MH02 \
           MP01 \
           MP02 \
           MR02 \
           MVC02 \
           MVCL02 \
           MVCL03 \
           MVI02 \
           MVIY01 \
           MVN02 \
           MVO01 \
           MVO02 \
           MVST01 \
           MVZ01 \
           N01 \
           N02 \
           N03 \
           NC01 \
           NC02 \
           NC03 \
           NI01 \
           NI02 \
           NR01 \
           NR02 \
           NR03 \
           O01 \
           O02 \
           OC01 \
           OC02 \
           OFADBGMEM01 \
           OFADBGMEM02 \
           OFADBGREG01 \
           OI01 \
           OI02 \
           OR02 \
           PACK01  \
           PACK02  \
           PACK03 \
           PC01  \
           PKA01  \
           PR01  \
           S01 \
           SLA01 \
           SLA02 \
           SLDA01 \
           SLDA02 \
           SLDL01 \
           SLL01 \
           SPM01 \
           SR01 \
           SRA01 \
           SRDA01 \
           SRDL01 \
           SRL01 \
           SRLG01 \
           SRP01 \
           SRP02 \
           SRP03 \
           SRST01 \
           STCK01 \
           STCKE01 \
           STCM01 \
           STCMH01 \
           STD01 \
           STG01 \
           STHY01 \
           STM02 \
           STMG01 \
           STMH01 \
           STY01 \
           TMLH01 \
           TMLL01 \
           TMY01 \
           TP01 \
           TPROT01 \
           TS01 \
           UNPK01 \
           UNPK02 \
           UNPKA01  \
           X02 \
           XC01 \
           XC02 \
           XI01 \
           XI02 \
           XI03 \
           XR01 \
           XR03 \
           ZAP01 \
           ZAP02

exclude_dir_list = BCR01 \
           BSM01 \
           BSM02 
         
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


