target = CDS01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CDS01.asmo libCDS01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCDS01 $(LDFLAGS)

libCDS01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CDS01_interface.cpp

CDS01.asmo: CDS01.asmi
	$(OFASMC) -i CDS01.asmi -o $@

CDS01.asmi: CDS01.asm
	$(OFASMIF) -i CDS01.json
	$(OFASMPP) -i CDS01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
