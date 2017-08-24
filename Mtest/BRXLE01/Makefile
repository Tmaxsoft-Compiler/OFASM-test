target = BRXLE01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BRXLE01.asmo libBRXLE01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBRXLE01 $(LDFLAGS)

libBRXLE01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BRXLE01_interface.cpp

BRXLE01.asmo: BRXLE01.asmi
	$(OFASMC) -i BRXLE01.asmi -o $@

BRXLE01.asmi: BRXLE01.asm
	$(OFASMIF) -i BRXLE01.json
	$(OFASMPP) -i BRXLE01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
