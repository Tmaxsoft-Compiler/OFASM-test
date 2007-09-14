target = AHI01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp AHI01.asmo libAHI01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lAHI01 $(LDFLAGS)

libAHI01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ AHI01_interface.cpp

AHI01.asmo: AHI01.asmi
	$(OFASMC) -i AHI01.asmi -o $@

AHI01.asmi: AHI01.asm
	$(OFASMPP) -i AHI01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
