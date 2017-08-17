target = BSM02

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BSM02.asmo libBSM02.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBSM02 $(LDFLAGS)

libBSM02.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BSM02_interface.cpp

BSM02.asmo: BSM02.asmi
	$(OFASMC) -i BSM02.asmi -o $@

BSM02.asmi: BSM02.asm
	$(OFASMIF) -i BSM02.json
	$(OFASMPP) -i BSM02.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
