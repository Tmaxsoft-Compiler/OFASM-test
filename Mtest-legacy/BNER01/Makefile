target = BNER01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BNER01.asmo libBNER01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBNER01 $(LDFLAGS)

libBNER01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BNER01_interface.cpp

BNER01.asmo: BNER01.asmi
	$(OFASMC) -i BNER01.asmi -o $@

BNER01.asmi: BNER01.asm
	$(OFASMIF) -i BNER01.json
	$(OFASMPP) -i BNER01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) &> $(result)
	@diff $(result) $(result).result

