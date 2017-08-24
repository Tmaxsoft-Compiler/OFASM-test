target = LY01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LY01.asmo libLY01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLY01 $(LDFLAGS)

libLY01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LY01_interface.cpp

LY01.asmo: LY01.asmi
	$(OFASMC) -i LY01.asmi -o $@

LY01.asmi: LY01.asm
	$(OFASMIF) -i LY01.json
	$(OFASMPP) -i LY01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
