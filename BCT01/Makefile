target = BCT01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BCT01.asmo libBCT01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lBCT01 $(LDFLAGS)

libBCT01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BCT01_interface.cpp

BCT01.asmo: BCT01.asmi
	$(OFASMC) -i BCT01.asmi -o $@

BCT01.asmi: BCT01.asm
	$(OFASMIF) -i BCT01.json
	$(OFASMPP) -i BCT01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result
