target = J03

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp J03.asmo libJ03.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lJ03 $(LDFLAGS)

libJ03.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ J03_interface.cpp

J03.asmo: J03.asmi
	$(OFASMC) -i J03.asmi -o $@

J03.asmi: J03.asm
	$(OFASMIF) -i J03.json
	$(OFASMPP) -i J03.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
