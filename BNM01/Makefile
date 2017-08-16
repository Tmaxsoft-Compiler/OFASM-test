target = BNM01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BNM01.asmo libBNM01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBNM01 $(LDFLAGS)

libBNM01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BNM01_interface.cpp

BNM01.asmo: BNM01.asmi
	$(OFASMC) -i BNM01.asmi -o $@

BNM01.asmi: BNM01.asm
	$(OFASMIF) -i BNM01.json
	$(OFASMPP) -i BNM01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

