target = BC01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BC01.asmo libBC01.so
	 g++ $(CFLAGS) -o $@ main.cpp -L./ -lBC01 $(LDFLAGS)

libBC01.so:
	 g++ -shared -fPIC $(CFLAGS) -o $@ BC01_interface.cpp

BC01.asmo: BC01.asmi
	 $(OFASMC) -i BC01.asmi -o $@

BC01.asmi: BC01.asm
	 $(OFASMIF) -i BC01.json
	 $(OFASMPP) -i BC01.asm -o $@

clean:
	 $(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
