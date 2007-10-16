target = SAM31

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SAM31.asmo libSAM31.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSAM31 $(LDFLAGS)

libSAM31.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SAM31_OFASM_VM_ENTRY.cpp

SAM31.asmo: SAM31.asmi
	$(OFASMC) -i SAM31.asmi -o $@

SAM31.asmi: SAM31.asm
	$(OFASMIF) -i SAM31.json
	$(OFASMPP) -i SAM31.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_OFASM_VM_ENTRY.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
