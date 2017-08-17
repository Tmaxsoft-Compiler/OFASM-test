target = BLH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BLH01.asmo libBLH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBLH01 $(LDFLAGS)

libBLH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BLH01_interface.cpp

BLH01.asmo: BLH01.asmi
	$(OFASMC) -i BLH01.asmi -o $@

BLH01.asmi: BLH01.asm
	$(OFASMIF) -i BLH01.json
	$(OFASMPP) -i BLH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
