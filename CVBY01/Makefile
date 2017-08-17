target = CVBY01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CVBY01.asmo libCVBY01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCVBY01 $(LDFLAGS)

libCVBY01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CVBY01_interface.cpp

CVBY01.asmo: CVBY01.asmi
	$(OFASMC) -i CVBY01.asmi -o $@

CVBY01.asmi: CVBY01.asm
	$(OFASMIF) -i CVBY01.json
	$(OFASMPP) -i CVBY01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
