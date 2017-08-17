target = BRXH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BRXH01.asmo libBRXH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBRXH01 $(LDFLAGS)

libBRXH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BRXH01_interface.cpp

BRXH01.asmo: BRXH01.asmi
	$(OFASMC) -i BRXH01.asmi -o $@

BRXH01.asmi: BRXH01.asm
	$(OFASMIF) -i BRXH01.json
	$(OFASMPP) -i BRXH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
