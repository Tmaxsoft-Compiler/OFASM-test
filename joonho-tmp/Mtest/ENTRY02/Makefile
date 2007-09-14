target = ENTRY02

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp ENTRY02.asmo libENTRY02.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lENTRY02 $(LDFLAGS)

libENTRY02.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ ENTRY02_interface.cpp

ENTRY02.asmo: ENTRY02.asmi
	$(OFASMC) -i ENTRY02.asmi -o $@

ENTRY02.asmi: ENTRY02.asm
	$(OFASMIF) -i ENTRY02.json
	$(OFASMPP) -i ENTRY02.asm -o $@

test:
	@./$(target) &> OUT
#	@diff OUT OUT.result

clean:
	$(RM) $(target) *.so *.asmo *.asmi OUT *_interface.cpp

