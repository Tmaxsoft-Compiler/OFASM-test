target = AHI01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp AHI01.asmo libAHI01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lAHI01 $(LDFLAGS)

libAHI01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ AHI01_interface.cpp

AHI01.asmo: AHI01.asmi
	$(OFASMC) -i AHI01.asmi -o $@

AHI01.asmi: AHI01.asm
	$(OFASMIF) -i AHI01.json
	$(OFASMPP) -i AHI01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
