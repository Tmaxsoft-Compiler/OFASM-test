target = NGR01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp NGR01.asmo libNGR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lNGR01 $(LDFLAGS)

libNGR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ NGR01_interface.cpp

NGR01.asmo: NGR01.asmi
	$(OFASMC) -i NGR01.asmi -o $@

NGR01.asmi: NGR01.asm
	$(OFASMPP) -i NGR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
