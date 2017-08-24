target = CS01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CS01.asmo libCS01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCS01 $(LDFLAGS)

libCS01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CS01_interface.cpp

CS01.asmo: CS01.asmi
	$(OFASMC) -i CS01.asmi -o $@

CS01.asmi: CS01.asm
	$(OFASMIF) -i CS01.json
	$(OFASMPP) -i CS01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
