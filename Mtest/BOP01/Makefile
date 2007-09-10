target = BOP01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BOP01.asmo libBOP01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBOP01 $(LDFLAGS)

libBOP01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BOP01_interface.cpp

BOP01.asmo: BOP01.asmi
	$(OFASMC) -i BOP01.asmi -o $@

BOP01.asmi: BOP01.asm
	$(OFASMIF) -i BOP01.json
	$(OFASMPP) -i BOP01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
