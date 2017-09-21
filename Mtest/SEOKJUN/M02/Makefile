target = M01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp M01.asmo libM01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lM01 $(LDFLAGS)

libM01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ M01_interface.cpp

M01.asmo: M01.asmi
	$(OFASMC) -i M01.asmi -o $@

M01.asmi: M01.asm
	$(OFASMIF) -i M01.json
	$(OFASMPP) -i M01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
