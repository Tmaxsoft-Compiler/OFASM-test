target = D01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp D01.asmo libD01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lD01 $(LDFLAGS)

libD01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ D01_interface.cpp

D01.asmo: D01.asmi
	$(OFASMC) -i D01.asmi -o $@

D01.asmi: D01.asm
	$(OFASMIF) -i D01.json
	$(OFASMPP) -i D01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
