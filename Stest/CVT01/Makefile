target = COPXOR

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp COPXOR.asmo libCOPXOR.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCOPXOR $(LDFLAGS)

libCOPXOR.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ COPXOR_interface.cpp

COPXOR.asmo: COPXOR.asmi
	$(OFASMC) -i COPXOR.asmi -o $@

COPXOR.asmi: COPXOR01.asm
	$(OFASMIF) -i COPXOR.json
	$(OFASMPP) -i COPXOR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test: 
	@./$(target) > OUT
	@diff $(result) $(result).result
