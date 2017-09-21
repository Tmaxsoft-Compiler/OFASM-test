target = CLI01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLI01.asmo libCLI01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLI01 $(LDFLAGS)

libCLI01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLI01_interface.cpp

CLI01.asmo: CLI01.asmi
	$(OFASMC) -i CLI01.asmi -o $@

CLI01.asmi: CLI01.asm
	$(OFASMIF) -i CLI01.json
	$(OFASMPP) -i CLI01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
