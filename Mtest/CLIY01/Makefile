target = CLIY01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLIY01.asmo libCLIY01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLIY01 $(LDFLAGS)

libCLIY01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLIY01_interface.cpp

CLIY01.asmo: CLIY01.asmi
	$(OFASMC) -i CLIY01.asmi -o $@

CLIY01.asmi: CLIY01.asm
	$(OFASMIF) -i CLIY01.json
	$(OFASMPP) -i CLIY01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
