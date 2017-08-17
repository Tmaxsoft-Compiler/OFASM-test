target = L01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp L01.asmo libL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lL01 $(LDFLAGS)

libL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ L01_interface.cpp

L01.asmo: L01.asmi
	$(OFASMC) -i L01.asmi -o $@

L01.asmi: L01.asm
	$(OFASMIF) -i L01.json
	$(OFASMPP) -i L01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
