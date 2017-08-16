target = SP02

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SP02.asmo libSP02.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSP02 $(LDFLAGS)

libSP02.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SP02_interface.cpp

SP02.asmo: SP02.asmi
	$(OFASMC) -i SP02.asmi -o $@

SP02.asmi: SP02.asm
	$(OFASMIF) -i SP02.json
	$(OFASMPP) -i SP02.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
