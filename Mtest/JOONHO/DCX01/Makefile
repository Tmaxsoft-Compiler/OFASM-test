target = DCX01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp DCX01.asmo libDCX01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lDCX01 $(LDFLAGS)

libDCX01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ DCX01_interface.cpp

DCX01.asmo: DCX01.asmi
	$(OFASMC) -i DCX01.asmi -o $@

DCX01.asmi: DCX01.asm
	$(OFASMIF) -i DCX01.json
	$(OFASMPP) -i DCX01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
