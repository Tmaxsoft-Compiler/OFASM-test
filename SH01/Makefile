target = SH01

OFASMC = $(OFASM_HOME)/bin/ofasmc
OFASMPP = $(OFASM_HOME)/bin/ofasmpp

LDFLAGS += -L$(OFASM_HOME)/lib -lofasmVM -L$(TMAXDIR)/lib -lcli
CFLAGS += -g

all: $(target)

$(target): main.cpp SH01.asmo libSH01.so
	g++ $(CFLAGS) -o $@ main.cpp -L./ -lSH01 $(LDFLAGS)

libSH01.so:
	g++ -shared -fPIC $(CFLAGS) -o $@ SH01_interface.cpp

SH01.asmo: SH01.asmi
	$(OFASMC) -i SH01.asmi -o $@

SH01.asmi: SH01.asm
	$(OFASMPP) -i SH01.asm -o $@

clean:
	$(RM) $(target) *.so *.asmo *.asmi

install:
	cp *.so ./
