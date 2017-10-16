target = BELOW

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BELOW.asmo libBELOW.so ABOVE.asmo 
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBELOW $(LDFLAGS)

libBELOW.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BELOW_OFASM_VM_ENTRY.cpp

BELOW.asmo: BELOW.asmi
	$(OFASMC) -i BELOW.asmi -o BELOW.asmo
	$(OFASMC) -i ABOVE.asmi -o ABOVE.asmo

BELOW.asmi: BELOW.asm
	$(OFASMIF) -i BELOW.json
	$(OFASMPP) -i BELOW.asm -o BELOW.asmi
	$(OFASMPP) -i ABOVE.asm -o ABOVE.asmi

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result

