target = BRCT01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BRCT01.asmo libBRCT01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBRCT01 $(LDFLAGS)

libBRCT01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BRCT01_interface.cpp

BRCT01.asmo: BRCT01.asmi
	$(OFASMC) -i BRCT01.asmi -o $@

BRCT01.asmi: BRCT01.asm
	$(OFASMIF) -i BRCT01.json
	$(OFASMPP) -i BRCT01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
