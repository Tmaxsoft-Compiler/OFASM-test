target = CLGR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLGR01.asmo libCLGR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLGR01 $(LDFLAGS)

libCLGR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLGR01_interface.cpp

CLGR01.asmo: CLGR01.asmi
	$(OFASMC) -i CLGR01.asmi -o $@

CLGR01.asmi: CLGR01.asm
	$(OFASMIF) -i CLGR01.json
	$(OFASMPP) -i CLGR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
