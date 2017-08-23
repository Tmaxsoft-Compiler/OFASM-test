target = CKSM01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CKSM01.asmo libCKSM01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCKSM01 $(LDFLAGS)

libCKSM01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CKSM01_interface.cpp

CKSM01.asmo: CKSM01.asmi
	$(OFASMC) -i CKSM01.asmi -o $@

CKSM01.asmi: CKSM01.asm
	$(OFASMIF) -i CKSM01.json
	$(OFASMPP) -i CKSM01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
