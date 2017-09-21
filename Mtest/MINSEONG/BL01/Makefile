target = BL01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BL01.asmo libBL01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBL01 $(LDFLAGS)

libBL01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BL01_interface.cpp

BL01.asmo: BL01.asmi
	$(OFASMC) -i BL01.asmi -o $@

BL01.asmi: BL01.asm
	$(OFASMIF) -i BL01.json
	$(OFASMPP) -i BL01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
