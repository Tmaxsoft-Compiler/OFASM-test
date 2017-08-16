target = BHE01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BHE01.asmo libBHE01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBHE01 $(LDFLAGS)

libBHE01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BHE01_interface.cpp

BHE01.asmo: BHE01.asmi
	$(OFASMC) -i BHE01.asmi -o $@

BHE01.asmi: BHE01.asm
	$(OFASMIF) -i BHE01.json
	$(OFASMPP) -i BHE01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
