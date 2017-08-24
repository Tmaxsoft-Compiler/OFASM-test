target = BNH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BNH01.asmo libBNH01.so
	 g++ $(CFLAGS) -o $@ main.cpp -L./ -lBNH01 $(LDFLAGS)

libBNH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BNH01_interface.cpp

BNH01.asmo: BNH01.asmi
	$(OFASMC) -i BNH01.asmi -o $@

BNH01.asmi: BNH01.asm
	$(OFASMIF) -i BNH01.json
	$(OFASMPP) -i BNH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

