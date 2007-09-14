target = AH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp AH01.asmo libAH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lAH01 $(LDFLAGS)

libAH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ AH01_interface.cpp

AH01.asmo: AH01.asmi
	$(OFASMC) -i AH01.asmi -o $@

AH01.asmi: AH01.asm
	$(OFASMIF) -i AH01.json
	$(OFASMPP) -i AH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
