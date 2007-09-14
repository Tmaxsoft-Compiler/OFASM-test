target = "BRC01"

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BRC01.asmo libBRC01.so
	g++	$(CFLAGS) -o $@ main.cpp -L./ -lBRC01 $(LDFLAGS)

libBRC01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BRC01_interface.cpp

BRC01.asmo: BRC01.asmi
	$(OFASMC) -i BRC01.asmi -o $@

BRC01.asmi: BRC01.asm
	$(OFASMIF) -i BRC01.json
	$(OFASMPP) -i BRC01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
