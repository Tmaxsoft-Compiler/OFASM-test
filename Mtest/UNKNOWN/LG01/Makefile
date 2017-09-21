target = LG01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LG01.asmo libLG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLG01 $(LDFLAGS)

libLG01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LG01_interface.cpp

LG01.asmo: LG01.asmi
	$(OFASMC) -i LG01.asmi -o $@

LG01.asmi: LG01.asm
	$(OFASMIF) -i LG01.json
	$(OFASMPP) -i LG01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
