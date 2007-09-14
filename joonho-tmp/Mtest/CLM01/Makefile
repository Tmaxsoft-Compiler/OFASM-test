target = CLM01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLM01.asmo libCLM01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLM01 $(LDFLAGS)

libCLM01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLM01_interface.cpp

CLM01.asmo: CLM01.asmi
	$(OFASMC) -i CLM01.asmi -o $@

CLM01.asmi: CLM01.asm
	$(OFASMIF) -i CLM01.json
	$(OFASMPP) -i CLM01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
