target = BLR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BLR01.asmo libBLR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBLR01 $(LDFLAGS)

libBLR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BLR01_interface.cpp

BLR01.asmo: BLR01.asmi
	$(OFASMC) -i BLR01.asmi -o $@

BLR01.asmi: BLR01.asm
	$(OFASMIF) -i BLR01.json
	$(OFASMPP) -i BLR01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
