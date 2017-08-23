target = SVC19

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SVC19.asmo
	g++ $(CFLAGS) -o $@ main.cpp SVC19_interface.cpp $(LDFLAGS)

SVC19.asmo: SVC19.asmi
	$(OFASMC) -i SVC19.asmi -o $@

SVC19.asmi: SVC19.asm
	$(OFASMPP) -i SVC19.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
