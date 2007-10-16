target = AMODE31

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp AMODE31.asmo libAMODE31.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lAMODE31 $(LDFLAGS)

libAMODE31.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ AMODE31_OFASM_VM_ENTRY.cpp

AMODE31.asmo: AMODE31.asmi
	$(OFASMC) -i AMODE31.asmi -o $@

AMODE31.asmi: AMODE31.asm
	$(OFASMIF) -i AMODE31.json
	$(OFASMPP) -i AMODE31.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_OFASM_VM_ENTRY.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
