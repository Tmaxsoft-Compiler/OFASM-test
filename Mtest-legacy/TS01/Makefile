target = TS01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp TS01.asmo libTS01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lTS01 $(LDFLAGS)

libTS01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ TS01_interface.cpp

TS01.asmo: TS01.asmi
	$(OFASMC) -i TS01.asmi -o $@

TS01.asmi: TS01.asm
	$(OFASMIF) -i TS01.json
	$(OFASMPP) -i TS01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

