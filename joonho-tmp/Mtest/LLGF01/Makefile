target = LLGF01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LLGF01.asmo libLLGF01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLLGF01 $(LDFLAGS)

libLLGF01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LLGF01_interface.cpp

LLGF01.asmo: LLGF01.asmi
	$(OFASMC) -i LLGF01.asmi -o $@

LLGF01.asmi: LLGF01.asm
	$(OFASMIF) -i LLGF01.json
	$(OFASMPP) -i LLGF01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
