target = B01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp B01.asmo libB01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lB01 $(LDFLAGS)

libB01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ B01_interface.cpp

B01.asmo: B01.asmi
	$(OFASMC) -i B01.asmi -o $@

B01.asmi: B01.asm
	$(OFASMIF) -i B01.json
	$(OFASMPP) -i B01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
