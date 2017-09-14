target = LAE01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LAE01.asmo libLAE01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lLAE01 $(LDFLAGS)

libLAE01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ LAE01_interface.cpp

LAE01.asmo: LAE01.asmi
	$(OFASMC) -i LAE01.asmi -o $@

LAE01.asmi: LAE01.asm
	$(OFASMIF) -i LAE01.json
	$(OFASMPP) -i LAE01.asm -o $@

clean:
	$(RM) $(target) main *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
