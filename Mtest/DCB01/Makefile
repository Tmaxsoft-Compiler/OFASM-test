target = DCB01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp DCB01.asmo libDCB01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lDCB01 $(LDFLAGS)

libDCB01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ DCB01_interface.cpp

DCB01.asmo: DCB01.asmi
	$(OFASMC) -i DCB01.asmi -o $@

DCB01.asmi: DCB01.asm
	$(OFASMIF) -i DCB01.json
	$(OFASMPP) -i DCB01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
