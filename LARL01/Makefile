target = LARL01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LARL01.asmo libLARL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLARL01 $(LDFLAGS)

libLARL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LARL01_interface.cpp

LARL01.asmo: LARL01.asmi
	$(OFASMC) -i LARL01.asmi -o $@

LARL01.asmi: LARL01.asm
	$(OFASMIF) -i LARL01.json
	$(OFASMPP) -i LARL01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@echo LARL not supported due to relative address
	@./$(target)
	@diff $(result) $(result).result
