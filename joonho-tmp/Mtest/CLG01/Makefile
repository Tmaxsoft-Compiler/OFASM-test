target = CLG01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLG01.asmo libCLG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLG01 $(LDFLAGS)

libCLG01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLG01_interface.cpp

CLG01.asmo: CLG01.asmi
	$(OFASMC) -i CLG01.asmi -o $@

CLG01.asmi: CLG01.asm
	$(OFASMIF) -i CLG01.json
	$(OFASMPP) -i CLG01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
