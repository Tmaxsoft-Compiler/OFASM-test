target = DCZ01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp DCZ01.asmo libDCZ01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lDCZ01 $(LDFLAGS)

libDCZ01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ DCZ01_interface.cpp

DCZ01.asmo: DCZ01.asmi
	$(OFASMC) -i DCZ01.asmi -o $@

DCZ01.asmi: DCZ01.asm
	$(OFASMIF) -i DCZ01.json
	$(OFASMPP) -i DCZ01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
