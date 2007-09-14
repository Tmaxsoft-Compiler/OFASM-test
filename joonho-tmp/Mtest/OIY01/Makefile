target = OIY01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp OIY01.asmo libOIY01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lOIY01 $(LDFLAGS)

libOIY01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ OIY01_interface.cpp

OIY01.asmo: OIY01.asmi
	$(OFASMC) -i OIY01.asmi -o $@

OIY01.asmi: OIY01.asm
	$(OFASMPP) -i OIY01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
