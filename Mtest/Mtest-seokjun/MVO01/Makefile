target = MVO01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp MVO01.asmo libMVO01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMVO01 $(LDFLAGS)

libMVO01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ MVO01_interface.cpp

MVO01.asmo: MVO01.asmi
	$(OFASMC) -i MVO01.asmi -o $@

MVO01.asmi: MVO01.asm
	$(OFASMIF) -i MVO01.json
	$(OFASMPP) -i MVO01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
