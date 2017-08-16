target = LLGT01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LLGT01.asmo libLLGT01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLLGT01 $(LDFLAGS)

libLLGT01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LLGT01_interface.cpp

LLGT01.asmo: LLGT01.asmi
	$(OFASMC) -i LLGT01.asmi -o $@

LLGT01.asmi: LLGT01.asm
	$(OFASMIF) -i LLGT01.json
	$(OFASMPP) -i LLGT01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
