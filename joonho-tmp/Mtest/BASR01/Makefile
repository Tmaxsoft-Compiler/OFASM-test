target = BASR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BASR01.asmo libBASR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBASR01 $(LDFLAGS)

libBASR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BASR01_interface.cpp

BASR01.asmo: BASR01.asmi
	$(OFASMC) -i BASR01.asmi -o $@

BASR01.asmi: BASR01.asm
	$(OFASMIF) -i BASR01.json
	$(OFASMPP) -i BASR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
