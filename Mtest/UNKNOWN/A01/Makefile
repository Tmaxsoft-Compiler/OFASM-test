target = A01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp A01.asmo libA01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lA01 $(LDFLAGS)

libA01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ A01_interface.cpp

A01.asmo: A01.asmi
	$(OFASMC) -i A01.asmi -o $@

A01.asmi: A01.asm
	$(OFASMIF) -i A01.json
	$(OFASMPP) -i A01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
