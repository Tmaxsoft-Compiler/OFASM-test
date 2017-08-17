target = LGHI01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LGHI01.asmo libLGHI01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLGHI01 $(LDFLAGS)

libLGHI01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LGHI01_interface.cpp

LGHI01.asmo: LGHI01.asmi
	$(OFASMC) -i LGHI01.asmi -o $@

LGHI01.asmi: LGHI01.asm
	$(OFASMIF) -i LGHI01.json
	$(OFASMPP) -i LGHI01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
