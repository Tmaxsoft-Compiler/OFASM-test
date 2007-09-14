target = LOAD01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp LOAD01.asmo LOAD01A.asmo
	g++ $(CFLAGS) -o $@ main.cpp LOAD01_interface.cpp $(LDFLAGS)

LOAD01.asmo: LOAD01.asmi
	$(OFASMC) -i LOAD01.asmi -o $@

LOAD01.asmi: LOAD01.asm
	$(OFASMPP) -i LOAD01.asm -o $@

LOAD01A.asmo: LOAD01A.asmi
	$(OFASMC) -i LOAD01A.asmi -o $@

LOAD01A.asmi: LOAD01A.asm
	$(OFASMPP) -i LOAD01A.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
