target = SVC10

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SVC10.asmo
	g++ $(CFLAGS) -o $@ main.cpp SVC10_interface.cpp $(LDFLAGS)

SVC10.asmo: SVC10.asmi
	$(OFASMC) -i SVC10.asmi -o $@

SVC10.asmi: SVC10.asm
	$(OFASMPP) -i SVC10.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
