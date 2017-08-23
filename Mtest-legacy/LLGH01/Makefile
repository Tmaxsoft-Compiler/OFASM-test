target = LLGH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LLGH01.asmo libLLGH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLLGH01 $(LDFLAGS)

libLLGH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LLGH01_interface.cpp

LLGH01.asmo: LLGH01.asmi
	$(OFASMC) -i LLGH01.asmi -o $@

LLGH01.asmi: LLGH01.asm
	$(OFASMIF) -i LLGH01.json
	$(OFASMPP) -i LLGH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
