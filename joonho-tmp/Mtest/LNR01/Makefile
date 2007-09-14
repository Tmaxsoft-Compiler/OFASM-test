target = LNR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LNR01.asmo libLNR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLNR01 $(LDFLAGS)

libLNR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LNR01_interface.cpp

LNR01.asmo: LNR01.asmi
	$(OFASMC) -i LNR01.asmi -o $@

LNR01.asmi: LNR01.asm
	$(OFASMIF) -i LNR01.json
	$(OFASMPP) -i LNR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
