target = JN02

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp JN02.asmo libJN02.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lJN02 $(LDFLAGS)

libJN02.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ JN02_interface.cpp

JN02.asmo: JN02.asmi
	$(OFASMC) -i JN02.asmi -o $@

JN02.asmi: JN02.asm
	$(OFASMIF) -i JN02.json
	$(OFASMPP) -i JN02.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
