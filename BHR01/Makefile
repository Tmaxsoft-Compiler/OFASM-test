target = BHR01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BHR01.asmo libBHR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBHR01 $(LDFLAGS)

libBHR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BHR01_interface.cpp

BHR01.asmo: BHR01.asmi
	$(OFASMC) -i BHR01.asmi -o $@

BHR01.asmi: BHR01.asm
	$(OFASMIF) -i BHR01.json
	$(OFASMPP) -i BHR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

