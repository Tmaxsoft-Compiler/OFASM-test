target = CLOSE01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLOSE01.asmo libCLOSE01.so CLOSE01.so DATASET 
	cp *.asmo $(OPENFRAME_HOME)/volume_default/SYS1.USERLIB
	cp *.so $(OPENFRAME_HOME)/volume_default/SYS1.USERLIB
	cp *.jcl $(OPENFRAME_HOME)/volume_default/SYS1.JCLLIB

libCLOSE01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLOSE01_OFASM_VM_ENTRY.cpp

CLOSE01.asmo: CLOSE01.asmi
	$(OFASMC) -i CLOSE01.asmi -o $@

CLOSE01.asmi: CLOSE01.asm
	$(OFASMIF) -i CLOSE01.json
	$(OFASMPP) -i CLOSE01.asm -o $@

DATASET:
	-dsdelete TMAX.CLOSE01.INDD
	dscreate TMAX.CLOSE01.INDD -l 80
	cp TMAX.CLOSE01.INDD $(OPENFRAME_HOME)/temp
	dssave TMAX.CLOSE01.INDD -d NEWLINE

CLOSE01.so:
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLOSE01 $(LDFLAGS)

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_OFASM_VM_ENTRY.cpp

install:
	cp *.so ./

test:
	textrun -q -j$(PWD)/CLOSE01.jcl
