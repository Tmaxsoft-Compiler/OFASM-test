target = MVC01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp MVC01.asmo libMVC01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMVC01 $(LDFLAGS)

libMVC01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ MVC01_interface.cpp

MVC01.asmo: MVC01.asmi
	$(OFASMC) -i MVC01.asmi -o $@

MVC01.asmi: MVC01.asm
	$(OFASMPP) -i MVC01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
