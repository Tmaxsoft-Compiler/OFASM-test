target = O03

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp O03.asmo libO03.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lO03 $(LDFLAGS)

libO03.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ O03_interface.cpp

O03.asmo: O03.asmi
	$(OFASMC) -i O03.asmi -o $@

O03.asmi: O03.asm
	$(OFASMIF) -i O03.json
	$(OFASMPP) -i O03.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
