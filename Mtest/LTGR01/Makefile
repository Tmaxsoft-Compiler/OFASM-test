target = LTGR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LTGR01.asmo libLTGR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLTGR01 $(LDFLAGS)

libLTGR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LTGR01_interface.cpp

LTGR01.asmo: LTGR01.asmi
	$(OFASMC) -i LTGR01.asmi -o $@

LTGR01.asmi: LTGR01.asm
	$(OFASMIF) -i LTGR01.json
	$(OFASMPP) -i LTGR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
