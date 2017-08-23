target = SRP01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SRP01.asmo libSRP01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSRP01 $(LDFLAGS)

libSRP01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SRP01_interface.cpp

SRP01.asmo: SRP01.asmi
	$(OFASMC) -i SRP01.asmi -o $@

SRP01.asmi: SRP01.asm
	$(OFASMIF) -i SRP01.json
	$(OFASMPP) -i SRP01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
