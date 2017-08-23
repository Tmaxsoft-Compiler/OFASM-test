target = OC01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp OC01.asmo libOC01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lOC01 $(LDFLAGS)

libOC01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ OC01_interface.cpp

OC01.asmo: OC01.asmi
	$(OFASMC) -i OC01.asmi -o $@

OC01.asmi: OC01.asm
	$(OFASMIF) -i OC01.json
	$(OFASMPP) -i OC01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > $(result)
	@diff $(result) $(result).result

