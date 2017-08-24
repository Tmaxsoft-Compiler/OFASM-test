target = J01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp J01.asmo libJ01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lJ01 $(LDFLAGS)

libJ01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ J01_interface.cpp

J01.asmo: J01.asmi
	$(OFASMC) -i J01.asmi -o $@

J01.asmi: J01.asm
	$(OFASMIF) -i J01.json
	$(OFASMPP) -i J01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
