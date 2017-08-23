target = LGB01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LGB01.asmo libLGB01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLGB01 $(LDFLAGS)

libLGB01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LGB01_interface.cpp

LGB01.asmo: LGB01.asmi
	$(OFASMC) -i LGB01.asmi -o $@

LGB01.asmi: LGB01.asm
	$(OFASMIF) -i LGB01.json
	$(OFASMPP) -i LGB01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
