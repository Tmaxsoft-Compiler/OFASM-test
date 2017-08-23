target = ALY01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp ALY01.asmo libALY01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lALY01 $(LDFLAGS)

libALY01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ ALY01_interface.cpp

ALY01.asmo: ALY01.asmi
	$(OFASMC) -i ALY01.asmi -o $@

ALY01.asmi: ALY01.asm
	$(OFASMPP) -i ALY01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
