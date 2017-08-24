target = TM01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp TM01.asmo libTM01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lTM01 $(LDFLAGS)

libTM01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ TM01_interface.cpp

TM01.asmo: TM01.asmi
	$(OFASMC) -i TM01.asmi -o $@

TM01.asmi: TM01.asm
	$(OFASMIF) -i TM01.json
	$(OFASMPP) -i TM01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
