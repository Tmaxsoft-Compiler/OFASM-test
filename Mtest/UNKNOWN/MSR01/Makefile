target = MSR01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp MSR01.asmo libMSR01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lMSR01 $(LDFLAGS)

libMSR01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ MSR01_interface.cpp

MSR01.asmo: MSR01.asmi
	$(OFASMC) -i MSR01.asmi -o $@

MSR01.asmi: MSR01.asm
	$(OFASMPP) -i MSR01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
