target = LMH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LMH01.asmo libLMH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLMH01 $(LDFLAGS)

libLMH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LMH01_interface.cpp

LMH01.asmo: LMH01.asmi
	$(OFASMC) -i LMH01.asmi -o $@

LMH01.asmi: LMH01.asm
	$(OFASMIF) -i LMH01.json
	$(OFASMPP) -i LMH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
#	@diff $(result) $(result).result
