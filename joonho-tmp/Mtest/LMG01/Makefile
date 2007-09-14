target = LMG01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LMG01.asmo libLMG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLMG01 $(LDFLAGS)

libLMG01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LMG01_interface.cpp

LMG01.asmo: LMG01.asmi
	$(OFASMC) -i LMG01.asmi -o $@

LMG01.asmi: LMG01.asm
	$(OFASMIF) -i LMG01.json
	$(OFASMPP) -i LMG01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
#	@diff $(result) $(result).result
