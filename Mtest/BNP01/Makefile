target = BNP01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BNP01.asmo libBNP01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBNP01 $(LDFLAGS)

libBNP01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BNP01_interface.cpp

BNP01.asmo: BNP01.asmi
	$(OFASMC) -i BNP01.asmi -o $@

BNP01.asmi: BNP01.asm
	$(OFASMIF) -i BNP01.json
	$(OFASMPP) -i BNP01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

