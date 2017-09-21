target = DCP01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp DCP01.asmo libDCP01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lDCP01 $(LDFLAGS)

libDCP01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ DCP01_interface.cpp

DCP01.asmo: DCP01.asmi
	$(OFASMC) -i DCP01.asmi -o $@

DCP01.asmi: DCP01.asm
	$(OFASMIF) -i DCP01.json
	$(OFASMPP) -i DCP01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
