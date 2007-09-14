target = ALGR01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp ALGR01.asmo libALGR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lALGR01 $(LDFLAGS)

libALGR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ ALGR01_interface.cpp

ALGR01.asmo: ALGR01.asmi
	$(OFASMC) -i ALGR01.asmi -o $@

ALGR01.asmi: ALGR01.asm
	$(OFASMPP) -i ALGR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
