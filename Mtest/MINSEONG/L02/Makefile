target = L02

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp L02.asmo libL02.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lL02 $(LDFLAGS)

libL02.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ L02_interface.cpp

L02.asmo: L02.asmi
	$(OFASMC) -i L02.asmi -o $@

L02.asmi: L02.asm
	$(OFASMIF) -i L02.json
	$(OFASMPP) -i L02.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result

