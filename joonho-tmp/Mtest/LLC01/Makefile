target = LLC01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LLC01.asmo libLLC01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLLC01 $(LDFLAGS)

libLLC01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LLC01_interface.cpp

LLC01.asmo: LLC01.asmi
	$(OFASMC) -i LLC01.asmi -o $@

LLC01.asmi: LLC01.asm
	$(OFASMIF) -i LLC01.json
	$(OFASMPP) -i LLC01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
