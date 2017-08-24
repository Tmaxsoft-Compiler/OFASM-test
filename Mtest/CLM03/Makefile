target = CLM03

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLM03.asmo libCLM03.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLM03 $(LDFLAGS)

libCLM03.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLM03_interface.cpp

CLM03.asmo: CLM03.asmi
	$(OFASMC) -i CLM03.asmi -o $@

CLM03.asmi: CLM03.asm
	$(OFASMIF) -i CLM03.json
	$(OFASMPP) -i CLM03.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
