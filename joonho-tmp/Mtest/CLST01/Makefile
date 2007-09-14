target = CLST01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLST01.asmo libCLST01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLST01 $(LDFLAGS)

libCLST01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLST01_interface.cpp

CLST01.asmo: CLST01.asmi
	$(OFASMC) -i CLST01.asmi -o $@

CLST01.asmi: CLST01.asm
	$(OFASMIF) -i CLST01.json
	$(OFASMPP) -i CLST01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
