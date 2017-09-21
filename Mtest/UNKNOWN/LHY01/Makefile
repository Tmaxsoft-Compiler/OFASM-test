target = LHY01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LHY01.asmo libLHY01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLHY01 $(LDFLAGS)

libLHY01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LHY01_interface.cpp

LHY01.asmo: LHY01.asmi
	$(OFASMC) -i LHY01.asmi -o $@

LHY01.asmi: LHY01.asm
	$(OFASMIF) -i LHY01.json
	$(OFASMPP) -i LHY01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
