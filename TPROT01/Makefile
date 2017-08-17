target = TPROT01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp TPROT01.asmo libTPROT01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lTPROT01 $(LDFLAGS)

libTPROT01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ TPROT01_interface.cpp

TPROT01.asmo: TPROT01.asmi
	$(OFASMC) -i TPROT01.asmi -o $@

TPROT01.asmi: TPROT01.asm
	$(OFASMIF) -i TPROT01.json
	$(OFASMPP) -i TPROT01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
