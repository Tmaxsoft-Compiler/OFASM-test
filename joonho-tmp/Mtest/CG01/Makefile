target = CG01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CG01.asmo libCG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCG01 $(LDFLAGS)

libCG01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CG01_interface.cpp

CG01.asmo: CG01.asmi
	$(OFASMC) -i CG01.asmi -o $@

CG01.asmi: CG01.asm
	$(OFASMIF) -i CG01.json
	$(OFASMPP) -i CG01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
