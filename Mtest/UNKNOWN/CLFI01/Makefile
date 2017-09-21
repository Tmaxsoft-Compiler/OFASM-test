target = CLFI01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLFI01.asmo libCLFI01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLFI01 $(LDFLAGS)

libCLFI01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLFI01_interface.cpp

CLFI01.asmo: CLFI01.asmi
	$(OFASMC) -i CLFI01.asmi -o $@

CLFI01.asmi: CLFI01.asm
	$(OFASMIF) -i CLFI01.json
	$(OFASMPP) -i CLFI01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp core*

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
