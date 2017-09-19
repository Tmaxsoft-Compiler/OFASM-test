target = DCH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp DCH01.asmo libDCH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lDCH01 $(LDFLAGS)

libDCH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ DCH01_interface.cpp

DCH01.asmo: DCH01.asmi
	$(OFASMC) -i DCH01.asmi -o $@

DCH01.asmi: DCH01.asm
	$(OFASMIF) -i DCH01.json
	$(OFASMPP) -i DCH01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
