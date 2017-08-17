target = CSG01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CSG01.asmo libCSG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCSG01 $(LDFLAGS)

libCSG01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CSG01_interface.cpp

CSG01.asmo: CSG01.asmi
	$(OFASMC) -i CSG01.asmi -o $@

CSG01.asmi: CSG01.asm
	$(OFASMIF) -i CSG01.json
	$(OFASMPP) -i CSG01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
