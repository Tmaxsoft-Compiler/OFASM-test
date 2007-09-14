target = SRLG01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SRLG01.asmo libSRLG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSRLG01 $(LDFLAGS)

libSRLG01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SRLG01_interface.cpp

SRLG01.asmo: SRLG01.asmi
	$(OFASMC) -i SRLG01.asmi -o $@

SRLG01.asmi: SRLG01.asm
	$(OFASMIF) -i SRLG01.json
	$(OFASMPP) -i SRLG01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
