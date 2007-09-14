target = BALR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BALR01.asmo libBALR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBALR01 $(LDFLAGS)

libBALR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BALR01_interface.cpp

BALR01.asmo: BALR01.asmi
	$(OFASMC) -i BALR01.asmi -o $@

BALR01.asmi: BALR01.asm
	$(OFASMIF) -i BALR01.json
	$(OFASMPP) -i BALR01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
