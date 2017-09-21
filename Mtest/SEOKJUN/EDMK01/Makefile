target = EDMK01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp EDMK01.asmo libEDMK01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lEDMK01 $(LDFLAGS)

libEDMK01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ EDMK01_interface.cpp

EDMK01.asmo: EDMK01.asmi
	$(OFASMC) -i EDMK01.asmi -o $@

EDMK01.asmi: EDMK01.asm
	$(OFASMIF) -i EDMK01.json
	$(OFASMPP) -i EDMK01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
