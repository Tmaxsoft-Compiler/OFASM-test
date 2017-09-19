target = MVO03

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp MVO03.asmo libMVO03.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMVO03 $(LDFLAGS)

libMVO03.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ MVO03_interface.cpp

MVO03.asmo: MVO03.asmi
	$(OFASMC) -i MVO03.asmi -o $@

MVO03.asmi: MVO03.asm
	$(OFASMIF) -i MVO03.json
	$(OFASMPP) -i MVO03.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
