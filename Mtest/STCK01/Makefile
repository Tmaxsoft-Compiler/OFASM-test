target = STCK01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp STCK01.asmo libSTCK01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSTCK01 $(LDFLAGS)

libSTCK01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ STCK01_interface.cpp

STCK01.asmo: STCK01.asmi
	$(OFASMC) -i STCK01.asmi -o $@

STCK01.asmi: STCK01.asm
	$(OFASMIF) -i STCK01.json
	$(OFASMPP) -i STCK01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
