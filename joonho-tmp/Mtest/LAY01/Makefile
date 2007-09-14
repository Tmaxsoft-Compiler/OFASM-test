target = LAY01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LAY01.asmo libLAY01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLAY01 $(LDFLAGS)

libLAY01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LAY01_interface.cpp

LAY01.asmo: LAY01.asmi
	$(OFASMC) -i LAY01.asmi -o $@

LAY01.asmi: LAY01.asm
	$(OFASMIF) -i LAY01.json
	$(OFASMPP) -i LAY01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target)
	@diff $(result) $(result).result
