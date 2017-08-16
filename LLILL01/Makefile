target = LLILL01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LLILL01.asmo libLLILL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLLILL01 $(LDFLAGS)

libLLILL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LLILL01_interface.cpp

LLILL01.asmo: LLILL01.asmi
	$(OFASMC) -i LLILL01.asmi -o $@

LLILL01.asmi: LLILL01.asm
	$(OFASMIF) -i LLILL01.json
	$(OFASMPP) -i LLILL01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
