target = SRST01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SRST01.asmo libSRST01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSRST01 $(LDFLAGS)

libSRST01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SRST01_interface.cpp

SRST01.asmo: SRST01.asmi
	$(OFASMC) -i SRST01.asmi -o $@

SRST01.asmi: SRST01.asm
	$(OFASMIF) -i SRST01.json
	$(OFASMPP) -i SRST01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
