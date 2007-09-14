target = AP01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp AP01.asmo libAP01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lAP01 $(LDFLAGS)

libAP01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ AP01_interface.cpp

AP01.asmo: AP01.asmi
	$(OFASMC) -i AP01.asmi -o $@

AP01.asmi: AP01.asm
	$(OFASMIF) -i AP01.json
	$(OFASMPP) -i AP01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
