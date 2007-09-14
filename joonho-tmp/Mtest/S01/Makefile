target = S01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp S01.asmo libS01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lS01 $(LDFLAGS)

libS01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ S01_interface.cpp

S01.asmo: S01.asmi
	$(OFASMC) -i S01.asmi -o $@

S01.asmi: S01.asm
	$(OFASMIF) -i S01.json
	$(OFASMPP) -i S01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
