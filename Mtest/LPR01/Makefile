target = LPR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LPR01.asmo libLPR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLPR01 $(LDFLAGS)

libLPR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LPR01_interface.cpp

LPR01.asmo: LPR01.asmi
	$(OFASMC) -i LPR01.asmi -o $@

LPR01.asmi: LPR01.asm
	$(OFASMIF) -i LPR01.json
	$(OFASMPP) -i LPR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
