target = BNLH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp BNLH01.asmo libBNLH01.so
	 g++ $(CFLAGS) -o $@ main.cpp -L./ -lBNLH01 $(LDFLAGS)

libBNLH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ BNLH01_interface.cpp

BNLH01.asmo: BNLH01.asmi
	$(OFASMC) -i BNLH01.asmi -o $@

BNLH01.asmi: BNLH01.asm
	$(OFASMIF) -i BNLH01.json
	$(OFASMPP) -i BNLH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

