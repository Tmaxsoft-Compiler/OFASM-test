target = IC01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp IC01.asmo libIC01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lIC01 $(LDFLAGS)

libIC01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ IC01_interface.cpp

IC01.asmo: IC01.asmi
	$(OFASMC) -i IC01.asmi -o $@

IC01.asmi: IC01.asm
	$(OFASMIF) -i IC01.json
	$(OFASMPP) -i IC01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
