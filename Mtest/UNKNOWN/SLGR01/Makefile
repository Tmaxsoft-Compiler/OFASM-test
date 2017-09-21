target = SLGR01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SLGR01.asmo libSLGR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSLGR01 $(LDFLAGS)

libSLGR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SLGR01_interface.cpp

SLGR01.asmo: SLGR01.asmi
	$(OFASMC) -i SLGR01.asmi -o $@

SLGR01.asmi: SLGR01.asm
	$(OFASMPP) -i SLGR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
