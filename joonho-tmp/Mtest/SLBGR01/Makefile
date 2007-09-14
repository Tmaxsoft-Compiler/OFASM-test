target = SLBGR01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SLBGR01.asmo libSLBGR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSLBGR01 $(LDFLAGS)

libSLBGR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SLBGR01_interface.cpp

SLBGR01.asmo: SLBGR01.asmi
	$(OFASMC) -i SLBGR01.asmi -o $@

SLBGR01.asmi: SLBGR01.asm
	$(OFASMPP) -i SLBGR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
