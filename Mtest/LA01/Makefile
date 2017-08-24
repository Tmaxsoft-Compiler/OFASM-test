target = LA01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LA01.asmo libLA01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLA01 $(LDFLAGS)

libLA01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LA01_interface.cpp

LA01.asmo: LA01.asmi
	$(OFASMC) -i LA01.asmi -o $@

LA01.asmi: LA01.asm
	$(OFASMIF) -i LA01.json
	$(OFASMPP) -i LA01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
