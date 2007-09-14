target = LLGC01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LLGC01.asmo libLLGC01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLLGC01 $(LDFLAGS)

libLLGC01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LLGC01_interface.cpp

LLGC01.asmo: LLGC01.asmi
	$(OFASMC) -i LLGC01.asmi -o $@

LLGC01.asmi: LLGC01.asm
	$(OFASMIF) -i LLGC01.json
	$(OFASMPP) -i LLGC01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
