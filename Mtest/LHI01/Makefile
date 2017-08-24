target = LHI01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LHI01.asmo libLHI01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLHI01 $(LDFLAGS)

libLHI01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LHI01_interface.cpp

LHI01.asmo: LHI01.asmi
	$(OFASMC) -i LHI01.asmi -o $@

LHI01.asmi: LHI01.asm
	$(OFASMIF) -i LHI01.json
	$(OFASMPP) -i LHI01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
