target = CLR01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp CLR01.asmo libCLR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lCLR01 $(LDFLAGS)

libCLR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ CLR01_interface.cpp

CLR01.asmo: CLR01.asmi
	$(OFASMC) -i CLR01.asmi -o $@

CLR01.asmi: CLR01.asm
	$(OFASMPP) -i CLR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
