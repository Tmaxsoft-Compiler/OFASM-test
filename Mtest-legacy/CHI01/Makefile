target = CHI01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CHI01.asmo libCHI01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCHI01 $(LDFLAGS)

libCHI01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CHI01_interface.cpp

CHI01.asmo: CHI01.asmi
	$(OFASMC) -i CHI01.asmi -o $@

CHI01.asmi: CHI01.asm
	$(OFASMIF) -i CHI01.json
	$(OFASMPP) -i CHI01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp core*

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
