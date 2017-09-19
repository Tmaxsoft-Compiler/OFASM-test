target = CGR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CGR01.asmo libCGR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCGR01 $(LDFLAGS)

libCGR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CGR01_interface.cpp

CGR01.asmo: CGR01.asmi
	$(OFASMC) -i CGR01.asmi -o $@

CGR01.asmi: CGR01.asm
	$(OFASMIF) -i CGR01.json
	$(OFASMPP) -i CGR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
