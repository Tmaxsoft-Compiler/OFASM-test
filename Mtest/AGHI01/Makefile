target = AGHI01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp AGHI01.asmo libAGHI01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lAGHI01 $(LDFLAGS)

libAGHI01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ AGHI01_interface.cpp

AGHI01.asmo: AGHI01.asmi
	$(OFASMC) -i AGHI01.asmi -o $@

AGHI01.asmi: AGHI01.asm
	$(OFASMPP) -i AGHI01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
