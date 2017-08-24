target = SP01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SP01.asmo libSP01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSP01 $(LDFLAGS)

libSP01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SP01_interface.cpp

SP01.asmo: SP01.asmi
	$(OFASMC) -i SP01.asmi -o $@

SP01.asmi: SP01.asm
	$(OFASMPP) -i SP01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
