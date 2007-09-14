target = LLILF01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LLILF01.asmo libLLILF01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLLILF01 $(LDFLAGS)

libLLILF01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LLILF01_interface.cpp

LLILF01.asmo: LLILF01.asmi
	$(OFASMC) -i LLILF01.asmi -o $@

LLILF01.asmi: LLILF01.asm
	$(OFASMIF) -i LLILF01.json
	$(OFASMPP) -i LLILF01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
