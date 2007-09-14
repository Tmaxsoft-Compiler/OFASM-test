target = DP01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp DP01.asmo libDP01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lDP01 $(LDFLAGS)

libDP01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ DP01_interface.cpp

DP01.asmo: DP01.asmi
	$(OFASMC) -i DP01.asmi -o $@

DP01.asmi: DP01.asm
	$(OFASMIF) -i DP01.json
	$(OFASMPP) -i DP01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
