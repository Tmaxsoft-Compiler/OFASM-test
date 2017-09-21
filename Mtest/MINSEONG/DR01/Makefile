target = DR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp DR01.asmo libDR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lDR01 $(LDFLAGS)

libDR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ DR01_interface.cpp

DR01.asmo: DR01.asmi
	$(OFASMC) -i DR01.asmi -o $@

DR01.asmi: DR01.asm
	$(OFASMIF) -i DR01.json
	$(OFASMPP) -i DR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

