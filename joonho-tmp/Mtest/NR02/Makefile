target = NR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp NR01.asmo libNR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lNR01 $(LDFLAGS)

libNR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ NR01_interface.cpp

NR01.asmo: NR01.asmi
	$(OFASMC) -i NR01.asmi -o $@

NR01.asmi: NR01.asm
	$(OFASMIF) -i NR01.json
	$(OFASMPP) -i NR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
