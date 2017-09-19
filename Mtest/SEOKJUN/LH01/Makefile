target = LH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LH01.asmo libLH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLH01 $(LDFLAGS)

libLH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LH01_interface.cpp

LH01.asmo: LH01.asmi
	$(OFASMC) -i LH01.asmi -o $@

LH01.asmi: LH01.asm
	$(OFASMIF) -i LH01.json
	$(OFASMPP) -i LH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
