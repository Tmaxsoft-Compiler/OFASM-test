target = BNL01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BNL01.asmo libBNL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBNL01 $(LDFLAGS)

libBNL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BNL01_interface.cpp

BNL01.asmo: BNL01.asmi
	$(OFASMC) -i BNL01.asmi -o $@

BNL01.asmi: BNL01.asm
	$(OFASMIF) -i BNL01.json
	$(OFASMPP) -i BNL01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
