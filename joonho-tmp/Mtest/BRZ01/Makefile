target = BRZ01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BRZ01.asmo libBRZ01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBRZ01 $(LDFLAGS)

libBRZ01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BRZ01_interface.cpp

BRZ01.asmo: BRZ01.asmi
	$(OFASMC) -i BRZ01.asmi -o $@

BRZ01.asmi: BRZ01.asm
	$(OFASMIF) -i BRZ01.json
	$(OFASMPP) -i BRZ01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
