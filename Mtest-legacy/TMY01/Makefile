target = TMY01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp TMY01.asmo libTMY01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lTMY01 $(LDFLAGS)

libTMY01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ TMY01_interface.cpp

TMY01.asmo: TMY01.asmi
	$(OFASMC) -i TMY01.asmi -o $@

TMY01.asmi: TMY01.asm
	$(OFASMIF) -i TMY01.json
	$(OFASMPP) -i TMY01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
