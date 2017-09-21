target = CVB01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CVB01.asmo libCVB01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCVB01 $(LDFLAGS)

libCVB01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CVB01_interface.cpp

CVB01.asmo: CVB01.asmi
	$(OFASMC) -i CVB01.asmi -o $@

CVB01.asmi: CVB01.asm
	$(OFASMIF) -i CVB01.json
	$(OFASMPP) -i CVB01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
