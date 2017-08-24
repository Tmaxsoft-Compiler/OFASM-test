target = BNZ01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BNZ01.asmo libBNZ01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBNZ01 $(LDFLAGS)

libBNZ01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BNZ01_interface.cpp

BNZ01.asmo: BNZ01.asmi
	$(OFASMC) -i BNZ01.asmi -o $@

BNZ01.asmi: BNZ01.asm
	$(OFASMIF) -i BNZ01.json
	$(OFASMPP) -i BNZ01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
