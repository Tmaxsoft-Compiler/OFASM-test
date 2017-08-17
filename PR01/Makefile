target = PR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp PR01.asmo libPR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lPR01 $(LDFLAGS)

libPR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ PR01_interface.cpp

PR01.asmo: PR01.asmi
	$(OFASMC) -i PR01.asmi -o $@

PR01.asmi: PR01.asm
	$(OFASMIF) -i PR01.json
	$(OFASMPP) -i PR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
