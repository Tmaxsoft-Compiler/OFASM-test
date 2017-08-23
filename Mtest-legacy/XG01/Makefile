target = XG01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp XG01.asmo libXG01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lXG01 $(LDFLAGS)

libXG01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ XG01_interface.cpp

XG01.asmo: XG01.asmi
	$(OFASMC) -i XG01.asmi -o $@

XG01.asmi: XG01.asm
	$(OFASMPP) -i XG01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
