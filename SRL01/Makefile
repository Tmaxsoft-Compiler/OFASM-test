target = SRL01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SRL01.asmo libSRL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSRL01 $(LDFLAGS)

libSRL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SRL01_interface.cpp

SRL01.asmo: SRL01.asmi
	$(OFASMC) -i SRL01.asmi -o $@

SRL01.asmi: SRL01.asm
	$(OFASMIF) -i SRL01.json
	$(OFASMPP) -i SRL01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result

