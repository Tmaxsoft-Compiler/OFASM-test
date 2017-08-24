target = SRDL01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SRDL01.asmo libSRDL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSRDL01 $(LDFLAGS)

libSRDL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SRDL01_interface.cpp

SRDL01.asmo: SRDL01.asmi
	$(OFASMC) -i SRDL01.asmi -o $@

SRDL01.asmi: SRDL01.asm
	$(OFASMIF) -i SRDL01.json
	$(OFASMPP) -i SRDL01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

