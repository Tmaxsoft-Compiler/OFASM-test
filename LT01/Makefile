target = LT01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LT01.asmo libLT01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLT01 $(LDFLAGS)

libLT01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LT01_interface.cpp

LT01.asmo: LT01.asmi
	$(OFASMC) -i LT01.asmi -o $@

LT01.asmi: LT01.asm
	$(OFASMIF) -i LT01.json
	$(OFASMPP) -i LT01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
