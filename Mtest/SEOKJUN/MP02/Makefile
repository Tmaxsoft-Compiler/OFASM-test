target = MP01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp MP01.asmo libMP01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMP01 $(LDFLAGS)

libMP01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ MP01_interface.cpp

MP01.asmo: MP01.asmi
	$(OFASMC) -i MP01.asmi -o $@

MP01.asmi: MP01.asm
	$(OFASMIF) -i MP01.json
	$(OFASMPP) -i MP01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
