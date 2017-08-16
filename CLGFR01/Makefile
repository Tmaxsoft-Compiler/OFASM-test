target = CLGFR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLGFR01.asmo libCLGFR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLGFR01 $(LDFLAGS)

libCLGFR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLGFR01_interface.cpp

CLGFR01.asmo: CLGFR01.asmi
	$(OFASMC) -i CLGFR01.asmi -o $@

CLGFR01.asmi: CLGFR01.asm
	$(OFASMIF) -i CLGFR01.json
	$(OFASMPP) -i CLGFR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
