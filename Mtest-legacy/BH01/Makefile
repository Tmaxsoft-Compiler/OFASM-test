target = BH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BH01.asmo libBH01.so
	g++	$(CFLAGS) -o $@ main.cpp -L./ -lBH01 $(LDFLAGS)

libBH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BH01_interface.cpp

BH01.asmo: BH01.asmi
	$(OFASMC) -i BH01.asmi -o $@

BH01.asmi: BH01.asm
	$(OFASMIF) -i BH01.json
	$(OFASMPP) -i BH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
