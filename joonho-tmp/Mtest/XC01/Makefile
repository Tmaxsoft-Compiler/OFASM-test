target = XC01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp XC01.asmo libXC01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lXC01 $(LDFLAGS)

libXC01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ XC01_interface.cpp

XC01.asmo: XC01.asmi
	$(OFASMC) -i XC01.asmi -o $@

XC01.asmi: XC01.asm
	$(OFASMIF) -i XC01.json
	$(OFASMPP) -i XC01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

