target = SLDA01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SLDA01.asmo libSLDA01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSLDA01 $(LDFLAGS)

libSLDA01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SLDA01_interface.cpp

SLDA01.asmo: SLDA01.asmi
	$(OFASMC) -i SLDA01.asmi -o $@

SLDA01.asmi: SLDA01.asm
	$(OFASMIF) -i SLDA01.json
	$(OFASMPP) -i SLDA01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
