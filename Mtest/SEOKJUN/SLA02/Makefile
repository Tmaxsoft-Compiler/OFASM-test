target = SLA01

result = OUT

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SLA01.asmo libSLA01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSLA01 $(LDFLAGS)

libSLA01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SLA01_interface.cpp

SLA01.asmo: SLA01.asmi
	$(OFASMC) -i SLA01.asmi -o $@

SLA01.asmi: SLA01.asm
	$(OFASMIF) -i SLA01.json
	$(OFASMPP) -i SLA01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

install:
	cp *.so ./

test:
	@./$(target) > OUT
	@diff $(result) $(result).result
