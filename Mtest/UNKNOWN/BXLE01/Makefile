target = BXLE01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BXLE01.asmo libBXLE01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBXLE01 $(LDFLAGS)

libBXLE01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BXLE01_interface.cpp

BXLE01.asmo: BXLE01.asmi
	$(OFASMC) -i BXLE01.asmi -o $@

BXLE01.asmi: BXLE01.asm
	$(OFASMIF) -i BXLE01.json
	$(OFASMPP) -i BXLE01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
