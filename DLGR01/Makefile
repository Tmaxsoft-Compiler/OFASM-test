target = DLGR01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp DLGR01.asmo libDLGR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lDLGR01 $(LDFLAGS)

libDLGR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ DLGR01_interface.cpp

DLGR01.asmo: DLGR01.asmi
	$(OFASMC) -i DLGR01.asmi -o $@

DLGR01.asmi: DLGR01.asm
	$(OFASMPP) -i DLGR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
