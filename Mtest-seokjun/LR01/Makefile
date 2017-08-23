target = LR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LR01.asmo libLR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLR01 $(LDFLAGS)

libLR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LR01_interface.cpp

LR01.asmo: LR01.asmi
	$(OFASMC) -i LR01.asmi -o $@

LR01.asmi: LR01.asm
	$(OFASMIF) -i LR01.json
	$(OFASMPP) -i LR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
