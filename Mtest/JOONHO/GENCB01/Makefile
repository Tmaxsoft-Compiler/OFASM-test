target = GENCB01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp GENCB01.asmo libGENCB01.so GENCB01.so DATASET 
	cp *.asmo $(OPENFRAME_HOME)/volume_default/SYS1.USERLIB
	cp *.so $(OPENFRAME_HOME)/volume_default/SYS1.USERLIB
	cp *.jcl $(OPENFRAME_HOME)/volume_default/SYS1.JCLLIB

libGENCB01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ GENCB01_interface.cpp

GENCB01.asmo: GENCB01.asmi
	$(OFASMC) -i GENCB01.asmi -o $@

GENCB01.asmi: GENCB01.asm
	$(OFASMIF) -i GENCB01.json
	$(OFASMPP) -i GENCB01.asm -o $@

DATASET:
	-dsdelete GENCB01.OTDATA.ORG
	dscreate GENCB01.OTDATA.ORG
	cp GENCB01.OTDATA.ORG $(OPENFRAME_HOME)/temp
	dssave GENCB01.OTDATA.ORG
	-idcams delete GENCB01.KSDS.DATA		
	-dsdelete GENCB01.OTDATA	
	-dsdelete GENCB01.INDATA	
	idcams define CLUSTER -n GENCB01.KSDS.DATA -o KS -k 4,0 -l 80,80	
	dscreate GENCB01.INDATA	
	cp GENCB01.INDATA $(OPENFRAME_HOME)/temp	
	dssave GENCB01.INDATA -d NEWLINE
	idcams repro -i GENCB01.INDATA -o GENCB01.KSDS.DATA
	dscreate GENCB01.OTDATA

GENCB01.so:
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lGENCB01 $(LDFLAGS)

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	textrun -q -j$(PWD)/GENCB01.jcl
