target = BCTR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BCTR01.asmo libBCTR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBCTR01 $(LDFLAGS)

libBCTR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BCTR01_interface.cpp

BCTR01.asmo: BCTR01.asmi
	$(OFASMC) -i BCTR01.asmi -o $@

BCTR01.asmi: BCTR01.asm
	$(OFASMIF) -i BCTR01.json
	$(OFASMPP) -i BCTR01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
