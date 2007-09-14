target = NILL01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp NILL01.asmo libNILL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lNILL01 $(LDFLAGS)

libNILL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ NILL01_interface.cpp

NILL01.asmo: NILL01.asmi
	$(OFASMC) -i NILL01.asmi -o $@

NILL01.asmi: NILL01.asm
	$(OFASMIF) -i NILL01.json
	$(OFASMPP) -i NILL01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
