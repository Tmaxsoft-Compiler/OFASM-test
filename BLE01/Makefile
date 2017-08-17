target = BLE01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BLE01.asmo libBLE01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBLE01 $(LDFLAGS)

libBLE01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BLE01_interface.cpp

BLE01.asmo: BLE01.asmi
	$(OFASMC) -i BLE01.asmi -o $@

BLE01.asmi: BLE01.asm
	$(OFASMIF) -i BLE01.json
	$(OFASMPP) -i BLE01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
