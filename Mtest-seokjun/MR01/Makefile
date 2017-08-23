target = MR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp MR01.asmo libMR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMR01 $(LDFLAGS)

libMR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ MR01_interface.cpp

MR01.asmo: MR01.asmi
	$(OFASMC) -i MR01.asmi -o $@

MR01.asmi: MR01.asm
	$(OFASMIF) -i MR01.json
	$(OFASMPP) -i MR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
