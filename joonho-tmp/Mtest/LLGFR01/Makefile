target = LLGFR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LLGFR01.asmo libLLGFR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLLGFR01 $(LDFLAGS)

libLLGFR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LLGFR01_interface.cpp

LLGFR01.asmo: LLGFR01.asmi
	$(OFASMC) -i LLGFR01.asmi -o $@

LLGFR01.asmi: LLGFR01.asm
	$(OFASMIF) -i LLGFR01.json
	$(OFASMPP) -i LLGFR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
