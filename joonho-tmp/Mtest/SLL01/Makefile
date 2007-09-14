target = SLL01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SLL01.asmo libSLL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSLL01 $(LDFLAGS)

libSLL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SLL01_interface.cpp

SLL01.asmo: SLL01.asmi
	$(OFASMC) -i SLL01.asmi -o $@

SLL01.asmi: SLL01.asm
	$(OFASMIF) -i SLL01.json
	$(OFASMPP) -i SLL01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result

