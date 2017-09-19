target = BNHE01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BNHE01.asmo libBNHE01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBNHE01 $(LDFLAGS)

libBNHE01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BNHE01_interface.cpp

BNHE01.asmo: BNHE01.asmi
	$(OFASMC) -i BNHE01.asmi -o $@

BNHE01.asmi: BNHE01.asm
	$(OFASMIF) -i BNHE01.json
	$(OFASMPP) -i BNHE01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

