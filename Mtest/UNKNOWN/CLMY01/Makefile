target = CLMY01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLMY01.asmo libCLMY01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLMY01 $(LDFLAGS)

libCLMY01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLMY01_interface.cpp

CLMY01.asmo: CLMY01.asmi
	$(OFASMC) -i CLMY01.asmi -o $@

CLMY01.asmi: CLMY01.asm
	$(OFASMIF) -i CLMY01.json
	$(OFASMPP) -i CLMY01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
