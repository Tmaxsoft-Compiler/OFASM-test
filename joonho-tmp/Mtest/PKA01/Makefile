target = PKA01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp PKA01.asmo libPKA01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lPKA01 $(LDFLAGS)

libPKA01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ PKA01_interface.cpp

PKA01.asmo: PKA01.asmi
	$(OFASMC) -i PKA01.asmi -o $@

PKA01.asmi: PKA01.asm
	$(OFASMIF) -i PKA01.json
	$(OFASMPP) -i PKA01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
