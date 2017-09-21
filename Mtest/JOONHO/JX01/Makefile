target = JX01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp JX01.asmo libJX01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lJX01 $(LDFLAGS)

libJX01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ JX01_interface.cpp

JX01.asmo: JX01.asmi
	$(OFASMC) -i JX01.asmi -o $@

JX01.asmi: JX01.asm
	$(OFASMIF) -i JX01.json
	$(OFASMPP) -i JX01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
