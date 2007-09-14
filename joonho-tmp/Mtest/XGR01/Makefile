target = XGR01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp XGR01.asmo libXGR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lXGR01 $(LDFLAGS)

libXGR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ XGR01_interface.cpp

XGR01.asmo: XGR01.asmi
	$(OFASMC) -i XGR01.asmi -o $@

XGR01.asmi: XGR01.asm
	$(OFASMPP) -i XGR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
