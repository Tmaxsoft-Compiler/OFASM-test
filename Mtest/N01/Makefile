target = N01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp N01.asmo libN01.so
	 g++ $(CFLAGS) -o $@ main.cpp -L./ -lN01 $(LDFLAGS)

libN01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ N01_interface.cpp

N01.asmo: N01.asmi 
	$(OFASMC) -i N01.asmi -o $@

N01.asmi: N01.asm
	 $(OFASMIF) -i N01.json
	 $(OFASMPP) -i N01.asm -o $@

clean:
	 $(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	 cp *.so ./

test:
	 @./$(target) > OUT
	 @diff $(result) $(result).result
