target = LGR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LGR01.asmo libLGR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLGR01 $(LDFLAGS)

libLGR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LGR01_interface.cpp

LGR01.asmo: LGR01.asmi
	$(OFASMC) -i LGR01.asmi -o $@

LGR01.asmi: LGR01.asm
	$(OFASMIF) -i LGR01.json
	$(OFASMPP) -i LGR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
#	@./$(target) > OUT
#	@diff $(result) $(result).result
