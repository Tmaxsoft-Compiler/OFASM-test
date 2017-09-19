target = NILH01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp NILH01.asmo libNILH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lNILH01 $(LDFLAGS)

libNILH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ NILH01_interface.cpp

NILH01.asmo: NILH01.asmi
	$(OFASMC) -i NILH01.asmi -o $@

NILH01.asmi: NILH01.asm
	$(OFASMIF) -i NILH01.json
	$(OFASMPP) -i NILH01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
