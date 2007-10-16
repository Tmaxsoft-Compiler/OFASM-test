target = CALLER

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CALLER.asmo libCALLER.so SUBR01.asmo 
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCALLER $(LDFLAGS)

libCALLER.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CALLER_OFASM_VM_ENTRY.cpp

CALLER.asmo: CALLER.asmi
	$(OFASMC) -i CALLER.asmi -o CALLER.asmo
	$(OFASMC) -i SUBR01.asmi -o SUBR01.asmo

CALLER.asmi: CALLER.asm
	$(OFASMIF) -i CALLER.json
	$(OFASMPP) -i CALLER.asm -o CALLER.asmi
	$(OFASMPP) -i SUBR01.asm -o SUBR01.asmi

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_OFASM_VM_ENTRY.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result

