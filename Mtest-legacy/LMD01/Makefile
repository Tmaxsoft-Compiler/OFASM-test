target = LMD01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LMD01.asmo libLMD01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLMD01 $(LDFLAGS)

libLMD01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LMD01_interface.cpp

LMD01.asmo: LMD01.asmi
	$(OFASMC) -i LMD01.asmi -o $@

LMD01.asmi: LMD01.asm
	$(OFASMIF) -i LMD01.json
	$(OFASMPP) -i LMD01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
#	@diff $(result) $(result).result
