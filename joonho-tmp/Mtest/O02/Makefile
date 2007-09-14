target = O01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp O01.asmo libO01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lO01 $(LDFLAGS)

libO01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ O01_interface.cpp

O01.asmo: O01.asmi
	$(OFASMC) -i O01.asmi -o $@

O01.asmi: O01.asm
	$(OFASMIF) -i O01.json
	$(OFASMPP) -i O01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
