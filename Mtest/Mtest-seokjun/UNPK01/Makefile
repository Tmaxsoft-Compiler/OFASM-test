target = UNPK01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp UNPK01.asmo libUNPK01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lUNPK01 $(LDFLAGS)

libUNPK01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ UNPK01_interface.cpp

UNPK01.asmo: UNPK01.asmi
	$(OFASMC) -i UNPK01.asmi -o $@

UNPK01.asmi: UNPK01.asm
	$(OFASMIF) -i UNPK01.json
	$(OFASMPP) -i UNPK01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
