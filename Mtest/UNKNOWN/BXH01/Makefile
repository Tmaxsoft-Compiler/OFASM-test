target = BXH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BXH01.asmo libBXH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBXH01 $(LDFLAGS)

libBXH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BXH01_interface.cpp

BXH01.asmo: BXH01.asmi
	$(OFASMC) -i BXH01.asmi -o $@

BXH01.asmi: BXH01.asm
	$(OFASMIF) -i BXH01.json
	$(OFASMPP) -i BXH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
