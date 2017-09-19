target = LCR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LCR01.asmo libLCR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLCR01 $(LDFLAGS)

libLCR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LCR01_interface.cpp

LCR01.asmo: LCR01.asmi
	$(OFASMC) -i LCR01.asmi -o $@

LCR01.asmi: LCR01.asm
	$(OFASMIF) -i LCR01.json
	$(OFASMPP) -i LCR01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
