target = CH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CH01.asmo libCH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCH01 $(LDFLAGS)

libCH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CH01_interface.cpp

CH01.asmo: CH01.asmi
	$(OFASMC) -i CH01.asmi -o $@

CH01.asmi: CH01.asm
	$(OFASMIF) -i CH01.json
	$(OFASMPP) -i CH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
