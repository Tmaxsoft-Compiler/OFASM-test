target = LGH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LGH01.asmo libLGH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLGH01 $(LDFLAGS)

libLGH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LGH01_interface.cpp

LGH01.asmo: LGH01.asmi
	$(OFASMC) -i LGH01.asmi -o $@

LGH01.asmi: LGH01.asm
	$(OFASMIF) -i LGH01.json
	$(OFASMPP) -i LGH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
