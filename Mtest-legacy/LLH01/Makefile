target = LLH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LLH01.asmo libLLH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLLH01 $(LDFLAGS)

libLLH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LLH01_interface.cpp

LLH01.asmo: LLH01.asmi
	$(OFASMC) -i LLH01.asmi -o $@

LLH01.asmi: LLH01.asm
	$(OFASMIF) -i LLH01.json
	$(OFASMPP) -i LLH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
