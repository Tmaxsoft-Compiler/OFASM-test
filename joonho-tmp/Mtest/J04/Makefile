target = J04

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp J04.asmo libJ04.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lJ04 $(LDFLAGS)

libJ04.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ J04_interface.cpp

J04.asmo: J04.asmi
	$(OFASMC) -i J04.asmi -o $@

J04.asmi: J04.asm
	$(OFASMIF) -i J04.json
	$(OFASMPP) -i J04.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
