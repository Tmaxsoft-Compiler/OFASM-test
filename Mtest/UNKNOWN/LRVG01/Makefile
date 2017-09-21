target = LRVG01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LRVG01.asmo libLRVG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLRVG01 $(LDFLAGS)

libLRVG01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LRVG01_interface.cpp

LRVG01.asmo: LRVG01.asmi
	$(OFASMC) -i LRVG01.asmi -o $@

LRVG01.asmi: LRVG01.asm
	$(OFASMIF) -i LRVG01.json
	$(OFASMPP) -i LRVG01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
