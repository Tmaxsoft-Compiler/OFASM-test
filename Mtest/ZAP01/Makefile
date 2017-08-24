target = ZAP01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp ZAP01.asmo libZAP01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lZAP01 $(LDFLAGS)

libZAP01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ ZAP01_interface.cpp

ZAP01.asmo: ZAP01.asmi
	$(OFASMC) -i ZAP01.asmi -o $@

ZAP01.asmi: ZAP01.asm
	$(OFASMIF) -i ZAP01.json
	$(OFASMPP) -i ZAP01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result

