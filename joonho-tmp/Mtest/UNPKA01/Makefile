target = UNPKA01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp UNPKA01.asmo libUNPKA01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lUNPKA01 $(LDFLAGS)

libUNPKA01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ UNPKA01_interface.cpp

UNPKA01.asmo: UNPKA01.asmi
	$(OFASMC) -i UNPKA01.asmi -o $@

UNPKA01.asmi: UNPKA01.asm
	$(OFASMIF) -i UNPKA01.json
	$(OFASMPP) -i UNPKA01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
