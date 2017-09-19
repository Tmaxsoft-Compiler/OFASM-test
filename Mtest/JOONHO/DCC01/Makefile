target = DCC01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp DCC01.asmo libDCC01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lDCC01 $(LDFLAGS)

libDCC01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ DCC01_interface.cpp

DCC01.asmo: DCC01.asmi
	$(OFASMC) -i DCC01.asmi -o $@

DCC01.asmi: DCC01.asm
	$(OFASMIF) -i DCC01.json
	$(OFASMPP) -i DCC01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
