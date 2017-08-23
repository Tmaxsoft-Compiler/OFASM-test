target = CLC01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLC01.asmo libCLC01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLC01 $(LDFLAGS)

libCLC01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLC01_interface.cpp

CLC01.asmo: CLC01.asmi
	$(OFASMC) -i CLC01.asmi -o $@

CLC01.asmi: CLC01.asm
	$(OFASMIF) -i CLC01.json
	$(OFASMPP) -i CLC01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
