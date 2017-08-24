target = BAKR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BAKR01.asmo libBAKR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBAKR01 $(LDFLAGS)

libBAKR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BAKR01_interface.cpp

BAKR01.asmo: BAKR01.asmi
	$(OFASMC) -i BAKR01.asmi -o $@

BAKR01.asmi: BAKR01.asm
	$(OFASMIF) -i BAKR01.json
	$(OFASMPP) -i BAKR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
