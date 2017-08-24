target = XI01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp XI01.asmo libXI01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lXI01 $(LDFLAGS)

libXI01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ XI01_interface.cpp

XI01.asmo: XI01.asmi
	$(OFASMC) -i XI01.asmi -o $@

XI01.asmi: XI01.asm
	$(OFASMIF) -i XI01.json
	$(OFASMPP) -i XI01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
