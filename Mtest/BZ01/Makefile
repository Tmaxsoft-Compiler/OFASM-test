target = BZ01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BZ01.asmo libBZ01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBZ01 $(LDFLAGS)

libBZ01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BZ01_interface.cpp

BZ01.asmo: BZ01.asmi
	$(OFASMC) -i BZ01.asmi -o $@

BZ01.asmi: BZ01.asm
	$(OFASMIF) -i BZ01.json
	$(OFASMPP) -i BZ01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
