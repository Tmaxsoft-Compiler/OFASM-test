target = J02

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp J02.asmo libJ02.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lJ02 $(LDFLAGS)

libJ02.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ J02_interface.cpp

J02.asmo: J02.asmi
	$(OFASMC) -i J02.asmi -o $@

J02.asmi: J02.asm
	$(OFASMIF) -i J02.json
	$(OFASMPP) -i J02.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

