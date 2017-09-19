target = TP01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp TP01.asmo libTP01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lTP01 $(LDFLAGS)

libTP01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ TP01_interface.cpp

TP01.asmo: TP01.asmi
	$(OFASMC) -i TP01.asmi -o $@

TP01.asmi: TP01.asm
	$(OFASMIF) -i TP01.json
	$(OFASMPP) -i TP01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
