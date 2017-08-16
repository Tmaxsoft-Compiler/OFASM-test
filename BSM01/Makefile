target = BSM01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BSM01.asmo libBSM01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBSM01 $(LDFLAGS)

libBSM01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BSM01_interface.cpp

BSM01.asmo: BSM01.asmi
	$(OFASMC) -i BSM01.asmi -o $@

BSM01.asmi: BSM01.asm
	$(OFASMIF) -i BSM01.json
	$(OFASMPP) -i BSM01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
