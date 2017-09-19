target = DCF01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp DCF01.asmo libDCF01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lDCF01 $(LDFLAGS)

libDCF01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ DCF01_interface.cpp

DCF01.asmo: DCF01.asmi
	$(OFASMC) -i DCF01.asmi -o $@

DCF01.asmi: DCF01.asm
	$(OFASMIF) -i DCF01.json
	$(OFASMPP) -i DCF01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
