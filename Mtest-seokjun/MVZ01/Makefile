target = MVZ01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp MVZ01.asmo libMVZ01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMVZ01 $(LDFLAGS)

libMVZ01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ MVZ01_interface.cpp

MVZ01.asmo: MVZ01.asmi
	$(OFASMC) -i MVZ01.asmi -o $@

MVZ01.asmi: MVZ01.asm
	$(OFASMIF) -i MVZ01.json
	$(OFASMPP) -i MVZ01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
