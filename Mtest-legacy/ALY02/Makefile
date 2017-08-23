target = ALY02

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp ALY02.asmo libALY02.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lALY02 $(LDFLAGS)

libALY02.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ ALY02_interface.cpp

ALY02.asmo: ALY02.asmi
	$(OFASMC) -i ALY02.asmi -o $@

ALY02.asmi: ALY02.asm
	$(OFASMIF) -i ALY02.json
	$(OFASMPP) -i ALY02.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
