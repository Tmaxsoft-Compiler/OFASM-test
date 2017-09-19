target = UNPKA02

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp UNPKA02.asmo libUNPKA02.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lUNPKA02 $(LDFLAGS)

libUNPKA02.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ UNPKA02_interface.cpp

UNPKA02.asmo: UNPKA02.asmi
	$(OFASMC) -i UNPKA02.asmi -o $@

UNPKA02.asmi: UNPKA02.asm
	$(OFASMIF) -i UNPKA02.json
	$(OFASMPP) -i UNPKA02.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
