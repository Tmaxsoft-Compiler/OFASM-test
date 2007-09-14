target = MHI01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp MHI01.asmo libMHI01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMHI01 $(LDFLAGS)

libMHI01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ MHI01_interface.cpp

MHI01.asmo: MHI01.asmi
	$(OFASMC) -i MHI01.asmi -o $@

MHI01.asmi: MHI01.asm
	$(OFASMPP) -i MHI01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
