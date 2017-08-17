target = STCKE01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp STCKE01.asmo libSTCKE01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSTCKE01 $(LDFLAGS)

libSTCKE01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ STCKE01_interface.cpp

STCKE01.asmo: STCKE01.asmi
	$(OFASMC) -i STCKE01.asmi -o $@

STCKE01.asmi: STCKE01.asm
	$(OFASMIF) -i STCKE01.json
	$(OFASMPP) -i STCKE01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
