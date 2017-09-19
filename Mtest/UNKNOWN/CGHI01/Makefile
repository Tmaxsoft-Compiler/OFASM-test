target = CGHI01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CGHI01.asmo libCGHI01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCGHI01 $(LDFLAGS)

libCGHI01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CGHI01_interface.cpp

CGHI01.asmo: CGHI01.asmi
	$(OFASMC) -i CGHI01.asmi -o $@

CGHI01.asmi: CGHI01.asm
	$(OFASMIF) -i CGHI01.json
	$(OFASMPP) -i CGHI01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp core*

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
