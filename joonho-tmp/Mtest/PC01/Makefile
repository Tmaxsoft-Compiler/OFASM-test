target = PC01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp PC01.asmo libPC01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lPC01 $(LDFLAGS)

libPC01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ PC01_interface.cpp

PC01.asmo: PC01.asmi
	$(OFASMC) -i PC01.asmi -o $@

PC01.asmi: PC01.asm
	$(OFASMIF) -i PC01.json
	$(OFASMPP) -i PC01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	#@./$(target)
	#@diff $(result) $(result).result
