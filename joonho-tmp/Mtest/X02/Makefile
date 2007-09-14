target = X01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp X01.asmo libX01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lX01 $(LDFLAGS)

libX01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ X01_interface.cpp

X01.asmo: X01.asmi
	$(OFASMC) -i X01.asmi -o $@

X01.asmi: X01.asm
	$(OFASMIF) -i X01.json
	$(OFASMPP) -i X01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
