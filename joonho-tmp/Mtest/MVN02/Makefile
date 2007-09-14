target = MVN01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp MVN01.asmo libMVN01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMVN01 $(LDFLAGS)

libMVN01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ MVN01_interface.cpp

MVN01.asmo: MVN01.asmi
	$(OFASMC) -i MVN01.asmi -o $@

MVN01.asmi: MVN01.asm
	$(OFASMIF) -i MVN01.json
	$(OFASMPP) -i MVN01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
