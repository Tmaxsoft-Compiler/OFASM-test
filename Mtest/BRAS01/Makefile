target = BRAS01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BRAS01.asmo libBRAS01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBRAS01 $(LDFLAGS)

libBRAS01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BRAS01_interface.cpp

BRAS01.asmo: BRAS01.asmi
	$(OFASMC) -i BRAS01.asmi -o $@

BRAS01.asmi: BRAS01.asm
	$(OFASMIF) -i BRAS01.json
	$(OFASMPP) -i BRAS01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@echo BRAS INSTRUCTION NOT SUPPPORTED YET
#	@./$(target)
#	@diff $(result) $(result).result
