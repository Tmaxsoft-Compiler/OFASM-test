target = OR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp OR01.asmo libOR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lOR01 $(LDFLAGS)

libOR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ OR01_interface.cpp

OR01.asmo: OR01.asmi
	$(OFASMC) -i OR01.asmi -o $@

OR01.asmi: OR01.asm
	$(OFASMIF) -i OR01.json
	$(OFASMPP) -i OR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
