target = BNE01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BNE01.asmo libBNE01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBNE01 $(LDFLAGS)

libBNE01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BNE01_interface.cpp

BNE01.asmo: BNE01.asmi
	$(OFASMC) -i BNE01.asmi -o $@

BNE01.asmi: BNE01.asm
	$(OFASMIF) -i BNE01.json
	$(OFASMPP) -i BNE01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

