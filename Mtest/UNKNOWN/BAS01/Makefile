target = BAS01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BAS01.asmo libBAS01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBAS01 $(LDFLAGS)

libBAS01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BAS01_interface.cpp

BAS01.asmo: BAS01.asmi
	$(OFASMC) -i BAS01.asmi -o $@

BAS01.asmi: BAS01.asm
	$(OFASMIF) -i BAS01.json
	$(OFASMPP) -i BAS01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
