target = SW01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SW01.asmo libSW01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSW01 $(LDFLAGS)

libSW01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SW01_interface.cpp

SW01.asmo: SW01.asmi
	$(OFASMC) -i SW01.asmi -o $@

SW01.asmi: SW01.asm
	$(OFASMPP) -i SW01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
