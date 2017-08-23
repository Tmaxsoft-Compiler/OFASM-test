target = BM01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BM01.asmo libBM01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBM01 $(LDFLAGS)

libBM01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BM01_interface.cpp

BM01.asmo: BM01.asmi
	$(OFASMC) -i BM01.asmi -o $@

BM01.asmi: BM01.asm
	$(OFASMIF) -i BM01.json
	$(OFASMPP) -i BM01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
