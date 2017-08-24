target = PACK01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp PACK01.asmo libPACK01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lPACK01 $(LDFLAGS)

libPACK01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ PACK01_interface.cpp

PACK01.asmo: PACK01.asmi
	$(OFASMC) -i PACK01.asmi -o $@

PACK01.asmi: PACK01.asm
	$(OFASMIF) -i PACK01.json
	$(OFASMPP) -i PACK01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
