target = MVC01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp MVC01.asmo libMVC01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMVC01 $(LDFLAGS)

libMVC01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ MVC01_interface.cpp

MVC01.asmo: MVC01.asmi
	$(OFASMC) -i MVC01.asmi -o $@

MVC01.asmi: MVC01.asm
	$(OFASMIF) -i MVC01.json
	$(OFASMPP) -i MVC01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
