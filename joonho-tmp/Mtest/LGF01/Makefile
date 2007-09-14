target = LGF01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LGF01.asmo libLGF01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLGF01 $(LDFLAGS)

libLGF01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LGF01_interface.cpp

LGF01.asmo: LGF01.asmi
	$(OFASMC) -i LGF01.asmi -o $@

LGF01.asmi: LGF01.asm
	$(OFASMIF) -i LGF01.json
	$(OFASMPP) -i LGF01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
