target = BNLE01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BNLE01.asmo libBNLE01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBNLE01 $(LDFLAGS)

libBNLE01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BNLE01_interface.cpp

BNLE01.asmo: BNLE01.asmi
	$(OFASMC) -i BNLE01.asmi -o $@

BNLE01.asmi: BNLE01.asm
	$(OFASMIF) -i BNLE01.json
	$(OFASMPP) -i BNLE01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

