target = CLY01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLY01.asmo libCLY01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLY01 $(LDFLAGS)

libCLY01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLY01_interface.cpp

CLY01.asmo: CLY01.asmi
	$(OFASMC) -i CLY01.asmi -o $@

CLY01.asmi: CLY01.asm
	$(OFASMIF) -i CLY01.json
	$(OFASMPP) -i CLY01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
