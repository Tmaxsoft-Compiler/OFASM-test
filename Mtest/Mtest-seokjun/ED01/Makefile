target = ED01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp ED01.asmo libED01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lED01 $(LDFLAGS)

libED01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ ED01_interface.cpp

ED01.asmo: ED01.asmi
	$(OFASMC) -i ED01.asmi -o $@

ED01.asmi: ED01.asm
	$(OFASMIF) -i ED01.json
	$(OFASMPP) -i ED01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
