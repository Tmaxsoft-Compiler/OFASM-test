target = CLHHSI01_MAIN
interface_source = CLHHSI01_interface.cpp

OFASMPP = $(OFASM_HOME)/bin/ofasmpp
OFASMA = $(OFASM_HOME)/bin/ofasma
OFASMIF = $(OFASM_HOME)/bin/ofasmif

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLHHSI01.asmo $(interface_source)
	g++ $(CFLAGS) -o $@ main.cpp $(interface_source) $(LDFLAGS)

CLHHSI01.asmo: CLHHSI01.asm
	$(OFASMIF) -i CLHHSI01.json
	$(OFASMPP) -i CLHHSI01.asm -o CLHHSI01.asmi
	$(OFASMA) -i CLHHSI01.asmi -o CLHHSI01.asmo

clean:
	$(RM) $(target) *.so *.asmo *.asmi DATA2 $(interface_source)

install:
	cp $(target) *.asmo $(OPENFRAME_HOME)/volume_default/STEST.LOADLIB
	cp *.jcl $(OPENFRAME_HOME)/volume_default/STEST.JCLLIB/CLHHSI01

test:
	@./CLHHSI01_MAIN
