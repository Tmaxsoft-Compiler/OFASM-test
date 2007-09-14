target = OI01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp OI01.asmo libOI01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lOI01 $(LDFLAGS)

libOI01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ OI01_interface.cpp

OI01.asmo: OI01.asmi
	$(OFASMC) -i OI01.asmi -o $@

OI01.asmi: OI01.asm
	$(OFASMIF) -i OI01.json
	$(OFASMPP) -i OI01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
